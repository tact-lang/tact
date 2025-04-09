struct OptionalInside {
  n: Int?;
}

contract OptFieldStruct {
  inner: OptionalInside?;

  init() {
    self.inner = null;
  }
}