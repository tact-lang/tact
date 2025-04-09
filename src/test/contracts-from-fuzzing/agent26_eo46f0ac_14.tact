message A {
  val: Int;
}

message B {
  nested: A;
}

message C {
  nested: B;
}

contract Test {
  receive(msg: C) {
    let i = msg.nested.nested.val;
  }
}