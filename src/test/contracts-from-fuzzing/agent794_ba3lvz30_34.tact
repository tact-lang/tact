message(0x9999) MsgA {
  a: Int;
}

struct StructA {
  b: Bool;
}

struct Combo {
  msg: MsgA;
  st: StructA;
}

contract MixedMsgStruct {
  data: Combo;

  init() {
    self.data = Combo{
      msg: MsgA{ a: 77 },
      st: StructA{ b: true }
    };
  }
}
