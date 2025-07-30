struct InnerMost {
  leaf: Int;
}

struct Inner {
  node: InnerMost;
}

struct Middle {
  branch: Inner;
}

struct Outer {
  trunk: Middle;
}

contract DeepTree {
  tree: Outer;

  init() {
    self.tree = Outer{
      trunk: Middle{
        branch: Inner{
          node: InnerMost{ leaf: 77 }
        }
      }
    };
  }
}