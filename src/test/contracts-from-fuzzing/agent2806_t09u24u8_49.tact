struct WithSlice {
  s: Slice;
}

contract SliceStore {
  data: WithSlice;

  init() {
    self.data = WithSlice{s: "abc".asComment().asSlice()};
  }
}