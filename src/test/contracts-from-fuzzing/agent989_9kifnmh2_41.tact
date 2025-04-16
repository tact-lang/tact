struct Deep {
  a: Int;
  b: SubDeep;
}

struct SubDeep {
  c: Int;
  d: SubDeep2;
}

struct SubDeep2 {
  e: Int;
}

contract DeepDeeper {
  x: Deep;

  init() {
    self.x = Deep{ a:1, b: SubDeep{ c:2, d: SubDeep2{ e:3 } } };
  }
}