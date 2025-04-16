struct NestedMsg {
  foo: Int;
}

message(777) TestMsg {
  bar: Bool;
  inner: NestedMsg;
}

contract MsgStruct {
  val: TestMsg;

  init() {
    self.val = TestMsg{ bar: true, inner: NestedMsg{ foo: 123 } };
  }
}
