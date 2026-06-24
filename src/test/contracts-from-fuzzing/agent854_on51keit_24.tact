struct Multitype {
  intV: Int;
  boolV: Bool;
  addrV: Address;
  sliceV: Slice;
  cellV: Cell;
  strV: String;
}

contract MultiTypeContract {
  v: Multitype;

  init() {
    self.v = Multitype{
      intV:1, boolV:true, addrV:myAddress(), sliceV:emptyCell().asSlice(), cellV:emptyCell(), strV:"s"
    };
  }
}