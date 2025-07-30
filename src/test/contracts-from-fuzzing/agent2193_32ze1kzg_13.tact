struct SliceStruct {
  s: Slice;
  flag: Bool;
}

contract TestContract {
  sliceHolder: SliceStruct;

  init() {
    self.sliceHolder = SliceStruct{
      s: emptyCell().asSlice(),
      flag: true
    };
  }
}