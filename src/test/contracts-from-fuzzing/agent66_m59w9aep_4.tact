struct A {
  foo: Int?;
  bar: map<Int, Int>;
}

contract Test {
  data: A;
  init() {
    self.data = A{ foo: null, bar: emptyMap() };
  }
}