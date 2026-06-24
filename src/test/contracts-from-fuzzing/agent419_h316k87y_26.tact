// Complex combined optional nesting
struct Leaf {
  str: String?;
  val: Int;
}

struct Middle {
  l1: Leaf?;
  l2: Leaf?;
}

contract ComboOpt {
  m: Middle;

  init() {
    self.m = Middle{ l1:null, l2:null };
  }
}