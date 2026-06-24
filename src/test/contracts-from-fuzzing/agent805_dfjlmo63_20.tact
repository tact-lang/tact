contract StoragePrimitives {
  int_field: Int;
  bool_field: Bool;
  cell_field: Cell;
  slice_field: Slice;
  string_field: String;
  address_field: Address;

  init() {
    self.int_field = 1;
    self.bool_field = true;
    self.cell_field = emptyCell();
    self.slice_field = emptyCell().asSlice();
    self.string_field = "abc";
    self.address_field = myAddress();
  }
}
