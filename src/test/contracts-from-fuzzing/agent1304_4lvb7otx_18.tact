struct L5 { z: Int as uint8; }
struct L4 { l5: L5?; }
struct L3 { l4: L4; }
struct L2 { l3: L3?; }
struct L1 { l2: L2; }

contract DeepSerOpt {
  data: L1;

  init() {
    self.data = L1{ l2: L2{ l3: null } };
  }
}