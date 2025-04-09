// Very deep optional layer, testing nested serialization behavior
struct L5 { val: Int; }
struct L4 { l5: L5?; }
struct L3 { l4: L4?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract UltraDeepOpt {
  root: L1?;

  init() {
    self.root = L1{
      l2: null,
    };
  }
}