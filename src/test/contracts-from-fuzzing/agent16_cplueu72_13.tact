message Empty {}

contract Test {
  receive(msg: Empty) {
    let x = 1;
  }
}