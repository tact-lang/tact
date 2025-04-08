struct Text {
  content: String;
  author: String;
}

struct Document {
  title: String;
  pageCount: Int;
  hasImages: Bool;
  meta: Text;
}

contract StructFieldOrderTest {
  d: Document;

  init() {
    self.d = Document{
      title: "Hello",
      pageCount: 5,
      hasImages: true,
      meta: Text{
        content: "World",
        author: "Me"
      }
    };
  }
}