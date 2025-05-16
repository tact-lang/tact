struct OptionalSliceCell {
  s: Slice?;
  c: Cell?;
}

contract OptionalsCellSlice {
  data: OptionalSliceCell;

  init() {
    self.data = OptionalSliceCell{
      s: null,
      c: null
    };
  }
}