// structs outside contract scope
struct I { v: Int; }
struct O { inr: I; }

contract NestedStructInit2 {
  data: O;

  init() {
    self.data = O{ inr: I{v:5} };
  }
}
