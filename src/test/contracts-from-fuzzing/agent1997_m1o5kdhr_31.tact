struct Leaf {
  z: Int;
}

struct Mid {
  leaf: Leaf?;
}

struct TopMost {
  middle: Mid?;
}

contract NestedOptionalStructs {
  val: TopMost;

  init() {
    self.val = TopMost{
      middle: Mid{
        leaf: null
      }
    };
  }
}
