struct X { a: Int; b: Int? }
struct Y { c: Bool?; d: String; e: String? }

struct Z {
  first: X;
  second: Y;
}

contract NestedStructsX {
  z: Z;

  init() {
    self.z = Z{
      first: X{ a: 1, b: null },
      second: Y{ c: true, d: "hello", e: null },
    };
  }
}