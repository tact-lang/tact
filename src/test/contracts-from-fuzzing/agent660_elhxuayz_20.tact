struct NestedOptional {
  nested: Inner?;
}

struct Inner {
  val: Int?;
}

contract NestedOptionalTest {
  store: NestedOptional;

  init() {
    self.store = NestedOptional{
      nested: Inner{
        val: null
      }
    };
  }
}