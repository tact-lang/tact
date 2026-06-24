struct Mix {
  i: Int;
  b: Bool?;
  s: String;
  c: Cell?;
}

contract MixTest {
  mix: Mix;
  init() {
    self.mix = Mix{
      i:1,
      b:null,
      s:"hi",
      c:null
    };
  }
}