// test with message as persistent, containing nested struct
struct InnerSt {
  x: Int;
}

message(1234) ComplexMsg {
  inner: InnerSt;
  someStr: String;
}

contract MsgComplexField {
  data: ComplexMsg;

  init() {
    self.data=ComplexMsg{inner:InnerSt{x:77},someStr:"abc"};
  }
}