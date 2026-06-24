struct A {
  foo: Int;
}

contract NoDefaultInit {
  data: A;

  init() {
    self.data = A{foo: 55};
  }
}