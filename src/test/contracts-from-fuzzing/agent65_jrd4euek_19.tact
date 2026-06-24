struct VariousTypes {
  int1: Int;
  bool1: Bool;
  addr1: Address;
  cell1: Cell;
  slice1: Slice;
  builder1: Builder;
  string1: String;
  intOpt: Int?;
  boolOpt: Bool?;
  addrOpt: Address?;
  stringOpt: String?;
}

contract ComboFields {
  val: VariousTypes;
  init() {
    self.val = VariousTypes{
      int1: 1,
      bool1: false,
      addr1: myAddress(),
      cell1: emptyCell(),
      slice1: emptyCell().asSlice(),
      builder1: beginCell(),
      string1: "txt",
      intOpt: null,
      boolOpt: null,
      addrOpt: null,
      stringOpt: null
    };
  }
}