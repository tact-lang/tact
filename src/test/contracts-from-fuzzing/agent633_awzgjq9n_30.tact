struct OptionalSlice {
  data: Slice?;
}

contract OptionalSliceContract {
  s: OptionalSlice;

  init() {
    self.s = OptionalSlice{ data: null };
  }
}
