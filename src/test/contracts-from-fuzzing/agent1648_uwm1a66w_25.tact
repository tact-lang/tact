contract OptionalSliceCell {
  data1: Slice?;
  data2: Cell?;

  init() {
    self.data1 = null;
    self.data2 = null;
  }
}