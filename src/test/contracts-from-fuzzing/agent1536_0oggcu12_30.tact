// Chained optional nested contract parameters
struct Leaf {
  x: Int?;
}

struct Mid {
  leaf: Leaf?;
}

contract ParamChain(
  root: Mid?
) {
}