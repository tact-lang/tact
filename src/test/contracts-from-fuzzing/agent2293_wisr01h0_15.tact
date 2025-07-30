contract MultiPrimitive {
  intVal: Int = 314;
  boolVal: Bool = true;
  strVal: String = "str";
  addrVal: Address;
  cellVal: Cell;
  sliceVal: Slice;

  init(addr: Address, cell: Cell, slice: Slice) {
    self.addrVal = addr;
    self.cellVal = cell;
    self.sliceVal = slice;
  }
}