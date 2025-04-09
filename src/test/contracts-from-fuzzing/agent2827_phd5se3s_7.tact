struct O1 { a: Int?; }
struct O2 { a: O1?; }
struct O3 { a: O2?; }

contract OptChain {
  x: O3;

  init() {
    self.x = O3{a: null};
  }
}