struct A1 { x: Int; }
struct A2 { y: A1; }
struct A3 { z: A2; }

struct Top {
  val: A3;
  flag: Bool;
}

contract NoisyNest {
  nested: Top;

  init() {
    self.nested = Top{ val: A3{ z: A2{ y: A1{ x:99 } } }, flag:true };
  }
}
