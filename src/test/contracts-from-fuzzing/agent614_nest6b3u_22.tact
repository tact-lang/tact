struct Inner {
  foo: Int;
}

contract SelfOptional {
  data: Inner?;

  init() {
    self.data = Inner{foo:42};
  }
}