// deeply nested optional fields
struct L3 {
  z: Int?;
}

struct L2 {
  y: L3?;
}

struct L1 {
  x: L2?;
}

contract TestContract {
  val: L1;

  init() {
    self.val = L1{ x: null };
  }
}