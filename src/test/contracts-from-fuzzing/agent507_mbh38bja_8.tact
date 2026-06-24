struct Mixed {
  a: Int;
  b: Bool;
  c: Address;
  d: String;
  e: Cell;
  f: Slice;
}

contract DiverseFields {
  storage: Mixed;

  init() {
    self.storage = Mixed{
      a:1, b:true, c: myAddress(), d:"hi", e: emptyCell(), f: emptyCell().asSlice()
    };
  }
}
