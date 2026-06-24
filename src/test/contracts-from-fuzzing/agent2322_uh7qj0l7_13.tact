struct Ints1 {
  x1: Int; x2: Int; x3: Int;
}

struct Ints2 {
  y1: Int; y2: Int; y3: Int;
}

struct Ints3 {
  z1: Int; z2: Int; z3: Int;
}

struct Combined {
  a: Ints1;
  b: Ints2;
  c: Ints3;
}

contract ComboTest {
  combo: Combined = Combined{
    a: Ints1{ x1:1, x2:2, x3:3 },
    b: Ints2{ y1:4, y2:5, y3:6 },
    c: Ints3{ z1:7, z2:8, z3:9 }
  };

  init() {}
}
