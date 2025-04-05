struct Example {
  amount: Int = 5;
  note: String;
}

contract Test {
  receive() {
    let e = Example{ note: "hi" };
  }
}