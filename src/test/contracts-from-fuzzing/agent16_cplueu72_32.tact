message Zero {}

contract C {
  receive(msg: Zero) {
    let x = 1;
  }
}