struct OptS1 {
  x: Int?;
}

struct OptS2 {
  y: OptS1?;
}

contract Test41 {
  field: OptS2;

  init() {
    self.field = OptS2{ y: OptS1{x:null} };
  }
}