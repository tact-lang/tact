struct SliceCombo {
  s: Slice;
  sOpt: Slice?;
}

contract SliceStorage {
  sVars: SliceCombo;
  init() {
    self.sVars = SliceCombo{
      s: emptyCell().asSlice(),
      sOpt: null
    };
  }
}