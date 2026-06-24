struct A {
  v: Int as uint8;
}

contract SerialTest {
  a: A;

  init() {
    self.a = A{v: 255};
  }
}