struct Mix {
  a: Int;
  b: String?;
  c: Address;
  d: Cell?;
}

contract MixTest {
  mixed: Mix;

  init() {
    self.mixed = Mix{
      a:1,
      b:null,
      c:myAddress(),
      d:null
    };
  }
}