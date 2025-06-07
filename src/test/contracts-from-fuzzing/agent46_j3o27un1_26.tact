message MyMsg {
  foo: Int
}

message MyOtherMsg {
  bar: Int
}

contract Test {
  receive(msg: MyMsg) {
    let z = msg.foo;
  }
}