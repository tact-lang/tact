// Compose struct deeply nested with optionals, some null, some set
struct L4 {val: Int?;}
struct L3 {l4: L4?;}
struct L2 {l3: L3;}
struct L1 {l2: L2;}

contract PartialDeepOpt {
  d: L1;
  init() {
    self.d = L1{
      l2: L2{ l3: L3{ l4: null } }
    };
  }
}