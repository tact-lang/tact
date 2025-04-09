struct Combo {
  a: Int = 0;
  b: Bool = false;
  c: String = "";
  d: Int? = null;
  e: Nested? = null;
}

struct Nested {
  flag: Bool = true;
}

contract Test {
  combo: Combo = Combo{};
}