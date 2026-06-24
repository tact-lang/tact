struct Xtra {
  aa: Int?;
  bb: Int;
}

contract OptAfterReq {
  field: Xtra;

  init() {
    self.field = Xtra{ aa: null, bb: 88 };
  }
}