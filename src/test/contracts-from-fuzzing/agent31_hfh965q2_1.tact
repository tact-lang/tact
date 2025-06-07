struct Inner {
  foo: Int;
  bar: Bool;
}

contract Test {
  nested: Inner;
  
  init() {
    self.nested = Inner{foo: 1, bar: true};
  }
}