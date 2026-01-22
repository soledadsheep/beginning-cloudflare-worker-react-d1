import { renderHtml } from "./renderHtml";

export default {
  async fetch(_req: Request, env: Env): Promise<Response> {
    const [templateRow, { results }] = await Promise.all([
      env.DB.prepare("SELECT html_content FROM templates WHERE id = ? LIMIT 1").bind("html_content").first<{ html_content: string }>(),
      env.DB.prepare("SELECT * FROM comments LIMIT 3").all(),
    ]);

    const content = JSON.stringify(results, null, 2);
    const template = templateRow?.html_content ?? renderHtml(content);
    const html = template.replace("{{content}}", content);

    return new Response(html, {
      headers: { "content-type": "text/html;charset=UTF-8" },
      status: 200,
    });
  },
} satisfies ExportedHandler<Env>;