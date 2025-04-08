struct Mix {
  i: Int;
  b: Bool?;
  s: String;
}

contract MixedPrims {
  f: Mix;

  init() {
    self.f = Mix{
      i:1,b:null,s:"x"
    };
  }
}