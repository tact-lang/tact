struct Data {
  value: Int
}

contract Test {
  receive() {
    let d = Data{ value: 5 };
  }
}