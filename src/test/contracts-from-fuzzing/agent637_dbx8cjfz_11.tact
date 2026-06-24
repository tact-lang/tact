// excessively nested mixture of optional primitives
struct L1 { x: Int?; y: Bool?; }
struct L2 { a: L1?; b: L1?; }
struct L3 { inner: L2?; }

contract TestContract {
  store: L3;

  init() {
    self.store = L3 {
      inner: L2 {
        a: L1 { x: 5, y: null },
        b: null
      }
    };
  }
}