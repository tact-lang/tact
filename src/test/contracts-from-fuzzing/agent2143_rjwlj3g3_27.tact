struct OptionalSliceCell {
  s: Slice?;
  c: Cell?;
}

contract OptionalsSliceCell {
  data: OptionalSliceCell;

  init() {
    self.data = OptionalSliceCell{s: null, c: null};
  }
}