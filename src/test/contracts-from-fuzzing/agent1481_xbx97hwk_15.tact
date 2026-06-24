struct OptionalDeep {
  a: Int?;
  b: OptionalInner?;
}

struct OptionalInner {
  x: Int?;
  y: Int;
}

contract OptDeepTest {
  val: OptionalDeep;
  init() {
    self.val = OptionalDeep{ a:null, b:null };
  }
}