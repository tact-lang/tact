struct X { s: String }
struct Y { xi: Int; x: X }

contract DeepFields {
  y: Y;

  init() {
    self.y = Y{
      xi: 42,
      x: X{ s: "nested" }
    };
  }
}