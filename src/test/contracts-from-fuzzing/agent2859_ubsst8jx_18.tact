struct Sub {
 x: Int;
}

struct Outer {
 s1: Sub;
 s2: Sub;
}

contract PartialAssign {
  data: Outer;

  init() {
    self.data = Outer{
      s1: Sub{ x:1 },
      s2: Sub{ x:2 }
    };
  }
}