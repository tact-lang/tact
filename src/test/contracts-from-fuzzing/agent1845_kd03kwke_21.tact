// Large nesting chain with multiple optional layers
struct Leaf { val: Int; }
struct L2 {leaf: Leaf?;}
struct L1 {l2: L2?;}

contract BigNestedOpts {
  v: L1?;

  init() {
    self.v = null;
  }
}
