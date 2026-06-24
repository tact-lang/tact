struct A {
  foo: Int;
}

contract UseDefaultVal {
  data: A = A{foo:123};

  init() {
    self.data = A{foo: 99};
  }
}