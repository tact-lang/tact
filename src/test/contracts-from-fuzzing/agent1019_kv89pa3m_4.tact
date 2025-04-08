struct OptionalInner {
  a: Int;
  b: Bool?;
  txt: String?;
}

contract WithOptionals {
  inner: OptionalInner;

  init() {
    self.inner = OptionalInner{ a: 5, b: null, txt: null };
  }
}
