struct OptionalDeep {
  a: Int?;
  b: Int?;
  c: Int?;
}

struct Wrapper {
  val: OptionalDeep?;
}

contract OptDeep {
  w: Wrapper;

  init() {
    self.w = Wrapper{ val: null };
  }
}