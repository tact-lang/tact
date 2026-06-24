struct Data {
  value: Int;
}

contract Test {
  receive() {
    let d = Data{ value: 5 };
    d.value = 10;
  }
}