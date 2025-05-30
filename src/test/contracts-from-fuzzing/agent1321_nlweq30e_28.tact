// Contract with deeply nested optional-filled structs, mixed types
struct L3 {
  s: String?;
  b: Bool?;
}

struct L2 {
  l3: L3?;
  n: Int?;
}

struct L1 {
  l2: L2?;
  flag: Bool?;
}

contract DeepCrazy {
  root: L1;

  init() {
    self.root = L1{
      l2: L2{ l3: L3{ s:null, b:true }, n:5 },
      flag: false
    };
  }
}
