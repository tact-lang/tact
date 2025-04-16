struct DeepLevel {
  a: Int;
  b: Bool?;
}

struct MiddleLevel {
  nested: DeepLevel;
  text: String;
}

contract DeeplyNested {
  info: MiddleLevel;

  init() {
    self.info = MiddleLevel{
      nested: DeepLevel{ a: 42, b: true },
      text: "hello"
    };
  }
}