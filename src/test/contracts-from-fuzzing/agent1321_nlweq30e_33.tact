// contract with composite of deeply nested optionals and many fields
struct L4 {
  a: Int?;
}

struct L3 {
  l4: L4?;
  b: Bool?;
}

struct L2 {
  l3: L3?;
  s: String?;
}

struct L1 {
  l2_1: L2?;
  l2_2: L2?;
}

contract NestedNest {
  root: L1;

  init() {
    self.root = L1{
      l2_1: L2{ l3: L3{ l4: L4{ a:null }, b:true }, s:null },
      l2_2: null
    };
  }
}
