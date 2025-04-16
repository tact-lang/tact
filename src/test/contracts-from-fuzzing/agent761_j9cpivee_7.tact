struct Leaf { val: Int }
struct Middle { left: Leaf; right: Leaf }
struct Top { branch1: Middle; branch2: Middle }

contract SymmetryTree {
  root: Top;

  init() {
    self.root = Top{
      branch1: Middle{ left: Leaf{ val: 1 }, right: Leaf{ val: 2 } },
      branch2: Middle{ left: Leaf{ val: 3 }, right: Leaf{ val: 4 } },
    };
  }
}