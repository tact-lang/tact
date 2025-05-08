// Struct optionals + defaults combined
struct Combo {
  a: Int? = null;
  b: Int = 42;
  c: Bool? = null;
  d: String = "X";
}

contract Test {
  combo: Combo = Combo{};
}