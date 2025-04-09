// test struct with address, primitive optionals, nested message with optional
message(0xDCBA) SubMsg {
  count: Int?;
}

struct CrazyNest {
  addr: Address;
  maybeStr: String?;
  flag: Bool = false;
  sub: SubMsg?;
}

contract StorageCrazyNest {
  s: CrazyNest;

  init() {
    self.s = CrazyNest{ addr: myAddress(), maybeStr: null, sub: null };
  }
}
