struct OptionalSliceCell {
  a: Slice?;
  b: Cell?;
}

contract OptSliceCell {
  storage: OptionalSliceCell;

  init() {
    self.storage = OptionalSliceCell{a:null,b:null};
  }
}