// Compose deeply nested serializations
struct D1 {
  a: Int as uint4;
}
struct D2 {
  d1: D1;
}
struct D3 {
  d2: D2;
}

contract DeepSerial {
  s: D3;
  init() {
    self.s = D3{ d2: D2{ d1: D1{ a: 5 } } };
  }
}