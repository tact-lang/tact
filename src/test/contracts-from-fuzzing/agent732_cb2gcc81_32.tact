struct ManyMix {
  a: Int?;
  b: Bool?;
  c: Int;
  d: Bool;
  e: String?;
  f: String;
  g: Address?;
  h: Address;
}

contract ManyMixTest {
  data: ManyMix;

  init() {
    self.data = ManyMix{
      a: null, b: true, c: 1, d: false,
      e: null, f: "str", g: null, h: myAddress()
    };
  }
}