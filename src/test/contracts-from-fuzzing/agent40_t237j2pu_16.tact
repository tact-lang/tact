struct Wrapped {
  val: Int;
}

message Container {
  w: Wrapped;
}

contract Test {
  receive(msg: Container) {
    let v = msg.w.val;
  }
}