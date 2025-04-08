struct ComposeSlices {
  s1: Slice;
  s2: Slice;
  s3: Slice;
}

contract SlicesTest {
  s: ComposeSlices;

  init() {
    let emptyS = emptyCell().asSlice();
    self.s = ComposeSlices{
      s1: emptyS,
      s2: emptyS,
      s3: emptyS
    };
  }
}
