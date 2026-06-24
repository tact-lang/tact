// Mixing optional contract param and defaults
struct Combo {
  x: Int? = null;
  y: Int = 123;
}

contract Test(foo: Combo) {}