struct MixBig {
  a: Int = 1;
  b: Int?;
  c: Bool = true;
  d: String?;
  e: Int = 5;
  f: Bool?;
  g: String = "foo";
  h: Int?;
  i: Bool = false;
  j: String?;
}

contract TestContract {
  big: MixBig;

  init() {
    self.big = MixBig{
      b: null,
      d: null,
      f: null,
      h: null,
      j: null
    };
  }
}