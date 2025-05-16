struct NestedSlices {
  slice1: Slice;
  optSlice: Slice?;
}

struct CellHolder {
  cell: Cell;
  nested: NestedSlices;
}

contract CellSliceStorage {
  payload: CellHolder;

  init() {
    self.payload = CellHolder{
      cell: emptyCell(),
      nested: NestedSlices{
        slice1: emptyCell().asSlice(),
        optSlice: null
      }
    };
  }

  receive() {
    let _ = self.payload.nested.slice1;
  }
}
