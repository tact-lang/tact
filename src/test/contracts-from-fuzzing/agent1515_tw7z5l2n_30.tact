struct BranchA {
  p: Int?;
  q: String = "";
}

struct BranchB {
  r: Bool = false;
  s: String?;
}

contract MultiBranches {
  left: BranchA;
  right: BranchB;

  init() {
    self.left = BranchA{ p: null, q: "left" };
    self.right = BranchB{ r: true, s: "right" };
  }

  receive() { dump(0); }
}