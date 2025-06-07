struct WrapSlice {
  s: Slice;
}

contract SliceHolder {
  val: WrapSlice;
  init() {
    self.val = WrapSlice { s: emptySlice() };
  }
}