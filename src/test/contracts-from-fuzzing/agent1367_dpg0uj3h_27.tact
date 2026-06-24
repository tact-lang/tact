struct OptionalSliceHolder {
  s: Slice?;
}

contract HasOptionalSlice {
  field: OptionalSliceHolder;

  init() {
    self.field = OptionalSliceHolder{ s: null };
  }
}