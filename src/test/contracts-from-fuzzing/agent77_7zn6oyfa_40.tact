// Optional nested optional inner struct with full initialization
struct Leaf {
  val: Int?;
}

struct Branch {
  leaf: Leaf?;
}

contract FullOpt {
  b: Branch;
  init() {
    self.b = Branch { leaf: Leaf { val: 123 } };
  }
}