// contract parameter with large nested struct with optionals
struct Piece {
  p: Int?;
}

struct Whole {
  a: Piece?;
  b: Piece?;
  c: Piece?;
}

contract BigParam(
  param: Whole
) {}