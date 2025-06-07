struct Complex {
  a: Int as uint32;
  b: Bool;
  c: String?;
  d: Slice as remaining;
}

contract ComplexStorage {
  value: Complex;

  init() {
    self.value = Complex{
      a: 32,
      b: true,
      c: "ok",
      d: emptyCell().asSlice()
    };
  }
}