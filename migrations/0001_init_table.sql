
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    id INTEGER PRIMARY KEY NOT NULL,
    author TEXT NOT NULL,
    content TEXT NOT NULL
);
INSERT INTO comments (author, content)
VALUES
    ('Kristian', 'Congrats!'),
    ('Serena', 'Great job!'),
    ('Max', 'Keep up the good work!');


DROP TABLE IF EXISTS templates;
CREATE TABLE
    templates (
        id TEXT PRIMARY KEY,
        html_content TEXT
    );
INSERT INTO
    templates (id, html_content)
VALUES ('html_content',
  '<!DOCTYPE html>
  <html lang=\"en\">
  <head>
    <meta charset=\"UTF-8\" />
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />
    <title>D1 Comments - DB Template</title>
    <link rel=\"stylesheet\" type=\"text/css\" href=\"https://static.integrations.cloudflare.com/styles.css\">
  </head>
  <body>
    <header>
      <img src=\"https://imagedelivery.net/wSMYJvS3Xw-n339CbDyDIA/30e0d3f6-6076-40f8-7abb-8a7676f83c00/public\" />
      <h1>🎉 D1 Comments Demo</h1>
    </header>
    <main>
      <p>Dữ liệu từ bảng comments (top 3):</p>
      <pre><code><span style=\"color: #0E838F\">> </span>SELECT * FROM comments LIMIT 3;<br>{{content}}</code></pre>
      <small class=\"blue\">
        <a target=\"_blank\" href=\"https://developers.cloudflare.com/d1/tutorials/build-a-comments-api/\">Build a comments API with Workers and D1</a>
      </small>
    </main>
  </body>
  </html>');
