struct Mixed {
  i: Int;
  b: Bool;
  s: String;
  opti: Int?;
  opts: String?;
  c: Cell;
  addr: Address;
  sli: Slice;
}

contract MixedTypes {
  val: Mixed;

  init() {
    self.val = Mixed{
      i: 1,
      b: false,
      s: "abc",
      opti: null,
      opts: null,
      c: emptyCell(),
      addr: myAddress(),
      sli: emptyCell().asSlice()
    };
  }
}