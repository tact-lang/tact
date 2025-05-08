struct HasSlice {
  s: Slice;
}

contract OptionalSlice {
  data: HasSlice?;

  init() {
    self.data = null;
  }
}