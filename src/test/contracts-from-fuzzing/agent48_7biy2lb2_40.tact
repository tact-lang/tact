struct WeirdMix {
  a: Int;          // required
  b: Int?;         // optional
  c: Int? = null;  // optional default null
  d: Int;          // required
  e: Int? = null;  // optional default null
  f: Int;          // required
}

contract TestContract {
  w: WeirdMix;

  init() {
    self.w = WeirdMix{
      a: 10,
      b: null,
      d: 30,
      f: 50
    };
  }
}