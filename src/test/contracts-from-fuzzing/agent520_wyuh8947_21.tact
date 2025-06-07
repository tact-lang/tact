// Combined optional and non-optional mixing contract
contract MixOptNonOpt {
  a: Int; b: Int?; c: Bool; d: Bool?; e: String; f: String?;

  init() {
    self.a=1; self.b=null; self.c=true; self.d=null; self.e="hi"; self.f=null;
  }
}