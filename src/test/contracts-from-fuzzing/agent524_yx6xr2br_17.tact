struct Composite {
  intField: Int;
  boolField: Bool;
  strField: String;
  cellField: Cell;
  sliceField: Slice;
  addrField: Address;
  optInt: Int?;
  optStr: String?;
}

contract CompositeStorage {
  c: Composite;

  init() {
    self.c = Composite{
      intField:1,
      boolField:true,
      strField:"ok",
      cellField:emptyCell(),
      sliceField:emptyCell().asSlice(),
      addrField:myAddress(),
      optInt:null,
      optStr:null,
    };
  }
}