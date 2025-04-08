struct Leaf {
  num: Int;
}

struct Stem {
  leaf: Leaf?;
}

struct Branch {
  label: String;
  stem: Stem?;
}

contract Test20 {
  branch: Branch?;

  init() {
    self.branch = null;
  }
}
