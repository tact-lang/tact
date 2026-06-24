struct Leaf {
  val: Int;
}

struct OuterOpt {
  optLeaf: Leaf?;
}

contract NullNestedInit {
  data: OuterOpt = OuterOpt{ optLeaf: null };
  receive() {}
}