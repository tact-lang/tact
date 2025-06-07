struct MixOptDefault {
  a: Int? = null;
  b: Bool?;
  c: String? = null;
}

contract MixOptDefaultContract {
  s: MixOptDefault;

  init() {
    self.s = MixOptDefault{ b:true };
  }
}