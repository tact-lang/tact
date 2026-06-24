struct DeepNest1 {
  a: Int;
  next: DeepNest2;
}

struct DeepNest2 {
  b: Int;
  next: DeepNest3;
}

struct DeepNest3 {
  c: Int;
  flag: Bool;
}

contract TestContract {
  d: DeepNest1;

  init() {
    self.d = DeepNest1{
      a: 1,
      next: DeepNest2{
        b: 2,
        next: DeepNest3{
          c: 3,
          flag: true
        }
      }
    };
  }
}