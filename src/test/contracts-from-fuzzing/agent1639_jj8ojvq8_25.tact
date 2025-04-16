message MEmpty {}

struct SE {
  m: MEmpty;
}

contract MsgInStruct {
  s: SE;

  init() {
    self.s = SE{ m: MEmpty{} };
  }
}
