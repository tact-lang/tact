struct Leaf {
  v: Int;
}
struct Mid {
  leaf: Leaf?;
}
contract NestedOpts {
  mid: Mid?;
  init() {
    self.mid = null;
  }
}
