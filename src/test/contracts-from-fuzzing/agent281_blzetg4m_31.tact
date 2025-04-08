// Very deep nesting, where innermost struct contains a string
struct L4 { val: String }
struct L3 { l4: L4 }
struct L2 { l3: L3 }
struct L1 { l2: L2 }

contract DeepFourLayer {
  root: L1;

  init() {
    self.root = L1{ l2: L2{ l3: L3{ l4: L4{ val:"deep" } } } };
  }
}