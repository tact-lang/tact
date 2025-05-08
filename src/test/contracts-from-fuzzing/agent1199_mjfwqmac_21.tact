struct Middle {
  a: Int;
  b: Inner;
}

struct Inner {
  c: Int;
  d: InnerMost;
}

struct InnerMost {
  e: Bool;
  f: String;
}

contract Test21 {
  m: Middle;

  init() {
    self.m = Middle{
      a:1,
      b: Inner{
        c:2,
        d: InnerMost{e:true, f:"hi"}
      }
    };
  }
}