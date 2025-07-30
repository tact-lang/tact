struct OptionalSliceStruct {
  data: Slice?;
}

contract OptionalSliceStorage {
  s: OptionalSliceStruct;

  init() {
    self.s = OptionalSliceStruct{data: null};
  }
}