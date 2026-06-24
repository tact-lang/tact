struct BigStruct {
  f01: Int;
  f02: Int?;
  f03: Bool;
  f04: Bool?;
  f05: Address;
  f06: Address?;
  f07: Cell;
  f08: Cell?;
  f09: Slice;
  f10: Slice?;
  f11: String;
  f12: String?;
}

contract Test {
  bigOpt: BigStruct?;

  init() {
    self.bigOpt = null;
  }
}