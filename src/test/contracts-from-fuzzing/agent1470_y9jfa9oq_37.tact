// A struct with deeply nested optional struct fields, one inside another repeatedly
struct L1 { s: String?; }
struct L2 { next: L1?; }
struct L3 { next: L2?; }
struct L4 { next: L3?; }

contract RecursiveOptChain {
  val: L4;

  init() {
    self.val = L4{ next: L3{ next: L2{ next: L1{ s:null } } } };
  }
}