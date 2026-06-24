struct RemainField {
  a: Int;
  b: Slice as remaining;
}

contract RemainingSliceTest {
  data: RemainField;

  init() {
    self.data = RemainField{
      a: 11,
      b: emptyCell().asSlice()
    };
  }
}