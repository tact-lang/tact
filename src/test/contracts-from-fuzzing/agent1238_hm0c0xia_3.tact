struct Complex {
  a: Int;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
  g: Int as uint32;
  h: Int as int64;
  i: Bool = true;
  j: String = "hi";
  k: Address? = null;
}

contract Test {
  data: Complex;
  init() {
    self.data = Complex{
      a: 42,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: 10,
      h: -10,
      i: false,
      j: "hello",
      k: null
    };
  }
}