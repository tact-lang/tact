// optional messages nested in struct
message(666) M666 {
  x: Int;
}

struct WithMsgOpt {
  m: M666?;
  txt: String = "";
}

contract OptMsgInStruct {
  p: WithMsgOpt;

  init() {
    self.p = WithMsgOpt{ m: null, txt: "X" };
  }
}
