struct MultiOptionalDeep {
  i: Int?;
  s: String?;
  nested: InnerOpt?;
}

struct InnerOpt {
  x: Int?;
  y: Bool?;
}

contract MultiOptDeepTest {
  data: MultiOptionalDeep = MultiOptionalDeep{ i:null, s:null, nested:null };
  init() {
    self.data = MultiOptionalDeep{ i:1, s:"hi", nested:InnerOpt{ x:2, y: true } };
  }
  receive() {}
}