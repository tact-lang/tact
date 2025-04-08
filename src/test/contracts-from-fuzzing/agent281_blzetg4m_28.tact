// Mix optional nested struct with overrides
struct DeepInner {
  a: Int?;
  b: String?;
}

struct Middle {
  inner: DeepInner;
  flag: Bool;
}

contract MixOptAndNested {
  st: Middle;

  init() {
    self.st = Middle{
      inner: DeepInner{ a:null, b:null },
      flag: true
    };
  }
}