// optional Message struct, which should be legal according to optional composition
message(0x1234) MsgStruct {
  a: Int;
}

struct Outer {
  m: MsgStruct?;
}

contract TestContract {
  field: Outer;
  init() {
    self.field = Outer{ m: null };
  }
}