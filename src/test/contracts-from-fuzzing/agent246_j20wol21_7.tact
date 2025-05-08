struct L1 {
  s: L2;
}

struct L2 {
  s: L3;
}

struct L3 {
  s: L4;
}

struct L4 {
  s: L5;
}

struct L5 {
  val: Int;
}

contract DeepChain {
  x: L1;

  init() {
    self.x = L1{ s: L2{ s: L3{ s: L4{ s: L5{ val: 99 } } } } };
  }
}
