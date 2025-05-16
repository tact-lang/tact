message X {}

struct Wrapper {
  x: X;
}

contract Test {
  receive() {
    let w = Wrapper{ x: X{} };
  }
}