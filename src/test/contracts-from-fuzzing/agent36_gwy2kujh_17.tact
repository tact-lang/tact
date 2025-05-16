message MessageA { a: Int; }
message MessageB { b: Int; }

contract Test {
  receive(msg: MessageA) {}
}