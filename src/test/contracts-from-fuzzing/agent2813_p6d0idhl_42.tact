struct L1 { next: L2?; }
struct L2 { next: L3?; }
struct L3 { next: L4?; }
struct L4 { next: L5?; }
struct L5 { x: Int = 42; }

contract TestDeepOptionalChain {
  data: L1;
  init() {
    self.data = L1{ next: L2{ next: L3{ next: L4{ next: L5{} } } } };
  }
}
