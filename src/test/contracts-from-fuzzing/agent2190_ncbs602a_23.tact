struct InnerMost2 {
  a: Int;
}

struct Inner2 {
  nested: InnerMost2?;
}

contract NestedStructFieldOptional {
  data: Inner2;

  init() {
    self.data = Inner2{ nested: null };
  }
}