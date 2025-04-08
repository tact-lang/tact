// deeply nested defaulted structs with optionals
struct L3 { x: Int? = null; }
struct L2 { l3: L3 = L3{}; }
struct L1 { l2: L2 = L2{}; }

contract Test {
  n: L1 = L1{};

  init() {}
}