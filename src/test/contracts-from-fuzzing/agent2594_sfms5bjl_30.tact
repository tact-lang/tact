struct DeepMix {
  a: Int;
  b: InnerMix;
}

struct InnerMix {
  s: String;
  nest: SubInner;
}

struct SubInner {
  flag: Bool;
  txt: String?;
}

contract ComplexNested {
  root: DeepMix;
  init() {
    self.root = DeepMix{
      a:0,
      b:InnerMix{
          s:"str",
          nest:SubInner{ flag:true, txt:null }
      }
    };
  }
}