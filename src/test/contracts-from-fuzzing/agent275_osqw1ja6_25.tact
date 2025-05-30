struct Leaf {
  a: Int?;
  b: Bool;
}

struct Middle {
  leaf1: Leaf;
  leaf2: Leaf;
  optional_leaf: Leaf?;
}

struct Root {
  mid1: Middle;
  mid2: Middle?;
  val: Int;
}

contract TestContract(
  root_param: Root,
  val2: Int,
) {}