struct S1 {
  a: Int;
}

struct S2 {
  a: Int;
}

struct Container {
  s1: S1;
  s2: S2;
}

contract SimilarStructs {
  data: Container;

  init() {
    self.data = Container{
      s1: S1{a: 10},
      s2: S2{a: 20}
    };
  }
}