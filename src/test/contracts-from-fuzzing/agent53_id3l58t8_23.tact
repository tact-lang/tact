struct Defaults {
  n: Int = 5;
}

contract Test {
  receive() {
    let d = Defaults {};
  }
}