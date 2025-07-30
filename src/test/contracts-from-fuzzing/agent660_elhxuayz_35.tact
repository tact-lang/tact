struct MultipleSlices {
  s1: Slice;
  s2: Slice;
}

contract MultipleSlicesTest {
  data: MultipleSlices;

  init() {
    self.data = MultipleSlices{
      s1: emptyCell().asSlice(),
      s2: emptyCell().asSlice(),
    };
  }
}