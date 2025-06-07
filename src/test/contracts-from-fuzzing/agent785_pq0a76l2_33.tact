// Multiple levels with various optional and default combinations
struct L4 {
  x: Int? = null;
}
struct L3 {
  l4: L4? = null;
}
struct L2 {
  l3: L3? = null;
}
struct L1 {
  l2: L2? = null;
}

contract MultiOptDef {
  myval: L1 = L1{};
  init() {
    self.myval = L1{ l2: L2{ l3: L3{ l4: L4{ x: 42 } } } };
  }
}
