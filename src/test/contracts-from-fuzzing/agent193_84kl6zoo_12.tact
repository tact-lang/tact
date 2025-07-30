struct BoolWrap { flag: Bool; }

contract OptionalBoolInStruct {
  inner: BoolWrap?;

  init() {
    self.inner = null;
  }
}