struct NestedSlices {
  slice: Slice;
  optSlice: Slice?;
}

contract SliceOptionalTest {
  data: NestedSlices;
  init() {
    self.data = NestedSlices{
      slice: emptyCell().asSlice(),
      optSlice: null
    };
  }
}