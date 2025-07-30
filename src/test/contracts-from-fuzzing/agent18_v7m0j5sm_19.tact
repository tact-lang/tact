struct OptionalWrap {
  inner: Int?;
}

contract ManyOptionalWrap {
  a: OptionalWrap;
  b: OptionalWrap;
  c: OptionalWrap;

  init() {
    self.a = OptionalWrap{ inner: null };
    self.b = OptionalWrap{ inner: null };
    self.c = OptionalWrap{ inner: null };
  }
}