struct MixedDefaultOptional {
  x: Int;
  y: Int?;
  z: Bool = true;
  w: Bool?;
}

contract MixedDefaultOptionalContract {
  f: MixedDefaultOptional;

  init() {
    self.f = MixedDefaultOptional{
      x: 1,
      y: null,
      w: null
    };
  }
}