// test nested optional field inside deeply nested structures
struct L1 { v: Int?; }
struct L2 { l1: L1; }
struct L3 { l2: L2; }
struct L4 { l3: L3; }

contract Test {
  data: L4;
  init() {
    self.data = L4{ l3: L3{ l2: L2{ l1: L1{ v:null } } } };
  }
}