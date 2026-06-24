struct Deep {
  a: Int;
  b: SubDeep;
}

struct SubDeep {
  c: Int;
  d: Sub2Deep;
}

struct Sub2Deep {
  e: Int;
  f: Int;
}

contract DeepStructs {
  s: Deep;

  init() {
    self.s = Deep{
      a: 1,
      b: SubDeep{
        c: 2,
        d: Sub2Deep{ e:3, f:4 }
      }
    };
  }
}