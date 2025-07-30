contract ComplexTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    strOpt: String?;

    init() {
      self.intVal = 1;
      self.boolVal = true;
      self.addrVal = myAddress();
      self.cellVal = emptyCell();
      self.sliceVal = emptyCell().asSlice();
      self.strVal = "hi";
      self.intOpt = null;
      self.boolOpt = null;
      self.addrOpt = null;
      self.cellOpt = null;
      self.sliceOpt = null;
      self.strOpt = null;
    }
}