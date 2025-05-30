struct DeepInner {
  x: Int;
}

struct DeepMid {
  inner: DeepInner;
}

contract MixDeep {
  a: Int;
  s: String;
  b: Bool;
  mid: DeepMid;

  init() {
    self.a=11;
    self.s="hi";
    self.b=true;
    self.mid=DeepMid{inner:DeepInner{x:77}};
  }
}