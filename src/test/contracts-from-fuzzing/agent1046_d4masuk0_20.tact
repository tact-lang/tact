struct Leaf {
  a: Int;
  b: Int = 5;
}

struct Mid {
  leaf: Leaf;
}

contract NestedPartialDefault {
  mid: Mid = Mid{ leaf: Leaf{ a: 42 } };
}
