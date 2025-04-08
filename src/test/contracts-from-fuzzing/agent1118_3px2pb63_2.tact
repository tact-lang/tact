struct InnerLevel2 {
  a: Int?;
  b: Int;
}

struct InnerLevel1 {
  nested: InnerLevel2;
}

contract DeepNestedTest {
  item: InnerLevel1;

  init() {
    self.item = InnerLevel1{
      nested: InnerLevel2{ a: null, b: 7 }
    };
  }
}