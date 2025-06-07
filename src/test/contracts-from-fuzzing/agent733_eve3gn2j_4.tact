struct L3 {
  x: Int = 42;
}

struct L2 {
  sub: L3? = null;
}

struct L1 {
  sub: L2 = L2{};
}

contract TestContract {
  root: L1 = L1{};
  init() {}
}