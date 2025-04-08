// Test a contract field with nested empty slice default
struct HasSlice {
  tail: Slice as remaining;
}

contract RemainSliceDefault {
  data: HasSlice;

  init() {
    self.data = HasSlice { tail: emptyCell().asSlice() };
  }
}