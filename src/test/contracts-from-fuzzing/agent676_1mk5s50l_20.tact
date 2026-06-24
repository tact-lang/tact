struct TextNested {
  title: String;
  meta: MetaData;
}

struct MetaData {
  description: String;
  copyright: Bool;
}

contract TextNestedContract {
  val: TextNested;

  init() {
    self.val = TextNested {
      title: "Title",
      meta: MetaData {
        description: "Desc",
        copyright: true
      }
    };
  }
}