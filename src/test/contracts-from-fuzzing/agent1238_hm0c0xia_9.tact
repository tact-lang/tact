struct Wide {
  a: Int;
  b: Bool;
  c: String;
  d: Address;
  e: Cell;
  f: Slice;
  g: Int?;
  h: Bool?;
  i: String?;
  j: Address?;
  k: Cell?;
  l: Slice?;
  m: Int as uint8;
  n: Int as int16;
  o: Bool = true;
  p: String = "def";
  q: Address? = null;
  r: Int? = null;
  s: Bool? = null;
  t: String? = null;
}

contract WideFields {
  data: Wide;
  init() {
    self.data = Wide{
      a: 1, b: false, c: "hi", d: myAddress(), e: emptyCell(), f: emptyCell().asSlice(),
      g: null, h: null, i: null, j: null, k: null, l: null,
      m: 2, n: -3, o: false, p: "changed", q: null, r: null, s: null, t: null
    };
  }
}