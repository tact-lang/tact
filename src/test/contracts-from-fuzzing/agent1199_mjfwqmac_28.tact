struct Zero { a: Int = 0; }
struct One { b: Int; }

contract Test28 {
  z: Zero;
  o: One;

  init() {
    self.z = Zero{};
    self.o = One{b:1};
  }
}