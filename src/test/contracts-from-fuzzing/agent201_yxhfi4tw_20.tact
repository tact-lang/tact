struct Leaf {
  x: Int?;
}

struct Mid {
  leaf: Leaf?;
}

contract Test20 {
  m: Mid = Mid{};
}