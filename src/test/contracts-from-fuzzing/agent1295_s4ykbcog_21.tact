// test with many optional message vs struct combinations
message(0x01) M1 { m1: Int?; }
message(0x02) M2 { m2: Bool?; }

struct Container {
  a: M1?;
  b: M2?;
}

contract ComplexOpt {
  val: Container;

  init() {
    self.val = Container{
      a: M1{ m1: 42 },
      b: M2{ m2: null }
    };
  }
}