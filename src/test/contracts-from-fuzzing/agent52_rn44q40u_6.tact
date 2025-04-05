struct Data {
  a: Int;
  b: Int?;
}

contract Test {
  receive() {
    let d1 = Data { a: 1, b: 2 };
    let d2 = Data { a: 3, b: null };
  }
}