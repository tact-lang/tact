struct DeepWide {
  a1: Int; a2: Int; a3: Int;
  b: InnerDeep;
  c: Int; d: Int; e: Int;
}

struct InnerDeep {
  x1: Bool; x2: Int; x3: Bool;
  y: LeafDeep;
  z1: String; z2: Int;
}

struct LeafDeep {
  p: Int;
  q: String;
}

contract DeepWideFields {
  val: DeepWide;

  init() {
    self.val = DeepWide{
      a1:1, a2:2, a3:3,
      b: InnerDeep{
        x1:true, x2:5, x3:false,
        y: LeafDeep{
          p:55,
          q:"deep"
        },
        z1:"leaf",
        z2:99
      },
      c:4, d:5, e:6
    };
  }
}