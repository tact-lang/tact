message B {}

struct A {
  b: B;
}

contract Test {
  receive() {
    let a = A{b: B{}};
  }
}