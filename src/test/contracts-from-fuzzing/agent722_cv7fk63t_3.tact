struct OptionalMix {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract OptionalStructTest {
  s: OptionalMix;
  init() {
    self.s = OptionalMix{
      a:null,
      b:true,
      c:null,
      d:null
    };
  }
}