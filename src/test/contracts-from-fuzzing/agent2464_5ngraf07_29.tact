struct T1 {
  a: Int;
}

struct T2 {
  o1: T1?;
}

contract OptStructRef {
  s: T2;
  init() {
    self.s = T2{
      o1: null
    };
  }
}