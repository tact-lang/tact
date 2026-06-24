struct OptionalSliceCell {
  sl: Slice?;
  ce: Cell?;
}

contract OptionalSliceCellContract {
  data: OptionalSliceCell;

  init() {
    self.data = OptionalSliceCell{
      sl: null,
      ce: null
    };
  }

  receive() {
    if (self.data.sl != null) {
      let _ = self.data.sl!!;
    }
  }
}
