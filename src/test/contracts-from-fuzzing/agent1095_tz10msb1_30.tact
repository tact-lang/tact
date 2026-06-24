struct SubA {
  a: Int;
}

struct SubB {
  b: Int;
}

struct Root {
  s1: SubA?;
  s2: SubB?;
}

contract MultiNullStructs {
  r: Root;

  init() {
    self.r = Root{
      s1: null,
      s2: null
    };
  }
}