struct Inner {
  foo: Int;
  bar: Bool;
}

contract TestContract {
  nested: Inner;
  
  init() {
    self.nested = Inner{ foo: 1, bar: true };
  }

  receive() {
    let _ = self.nested;
  }
}