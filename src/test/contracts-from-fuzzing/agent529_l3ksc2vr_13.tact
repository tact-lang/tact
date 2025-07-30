struct IntNest3 {
  v1: Int;
  v2: Int;
}

struct IntNest2 {
  n3: IntNest3;
}

struct IntNest1 {
  n2: IntNest2;
}

contract IntNestFields {
  f: IntNest1;

  init() {
    self.f = IntNest1{
      n2: IntNest2{
        n3: IntNest3{
          v1: 1,
          v2: 2
        }
      }
    };
  }
}