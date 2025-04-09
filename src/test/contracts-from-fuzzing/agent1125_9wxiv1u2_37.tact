struct Diverse {
  int_field: Int;
  bool_field: Bool;
  addr_field: Address;
  cell_field: Cell;
  slice_field: Slice;
  string_field: String;
  opt_int: Int?;
  opt_bool: Bool?;
  opt_addr: Address?;
  opt_cell: Cell?;
  opt_slice: Slice?;
  opt_string: String?;
}

contract Diversified {
  data: Diverse;
  init() {
    self.data = Diverse{
      int_field: 11,
      bool_field: true,
      addr_field: myAddress(),
      cell_field: emptyCell(),
      slice_field: emptyCell().asSlice(),
      string_field: "hi",
      opt_int: null,
      opt_bool: null,
      opt_addr: null,
      opt_cell: null,
      opt_slice: null,
      opt_string: null
    };
  }
}