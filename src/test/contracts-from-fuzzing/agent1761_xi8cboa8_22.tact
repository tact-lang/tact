struct DeepNestedStrings {
  inner: InnerLevel;
}

struct InnerLevel {
  s: String;
  deeper: DeeperLevel;
}

struct DeeperLevel {
  s: String?;
}

contract DeepStringTest {
  d: DeepNestedStrings;

  init() {
    self.d = DeepNestedStrings{
      inner: InnerLevel{
        s: "foo",
        deeper: DeeperLevel{ s: null }
      }
    };
  }
}