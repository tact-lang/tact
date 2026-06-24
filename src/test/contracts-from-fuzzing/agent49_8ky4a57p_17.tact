message NestedStructTest {
  s: Data;
}

struct Data {
  a: Int;
}

contract Test {
  receive() {
    let a: Int = 0;
  }
}