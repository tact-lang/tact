struct NestedLevel2 {
  val: Int as uint32;
}

struct NestedLevel1 {
  inner: NestedLevel2;
}

contract DeepNestedTest {
  nested: NestedLevel1;

  init() {
    self.nested = NestedLevel1{
      inner: NestedLevel2{
        val: 123,
      },
    };
  }
}