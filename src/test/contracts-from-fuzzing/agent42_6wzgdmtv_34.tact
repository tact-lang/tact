// Many nested layers with mixed optionals
struct A { b: B; c: Int?; }
struct B { d: C?; e: String; }
struct C { f: Bool?; g: Int; }

contract TestContract {
  x: A;

  init() {
    self.x = A{
      b: B{ d: null, e: "e" },
      c: null
    };
  }
}