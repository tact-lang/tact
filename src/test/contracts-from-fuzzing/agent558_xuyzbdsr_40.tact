// deeply nested combined optional/default
struct D1 {
  x: Int? = null;
}

struct D2 {
  y: D1? = null;
}

contract Test {
  z: D2 = D2{};
}