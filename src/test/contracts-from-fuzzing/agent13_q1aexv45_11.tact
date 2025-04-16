struct Leaf {
  v: Int;
}

struct Middle {
  leaf: Leaf?;
}

struct Top {
  mid: Middle?;
}

contract NestedOptional {
  val: Top?;

  init() {
    self.val = null;
  }
}