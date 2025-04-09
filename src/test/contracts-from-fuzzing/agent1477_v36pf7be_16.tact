struct Leaf {
  x: Int;
}

struct Branch {
  a: Leaf;
  b: Leaf;
  c: Leaf;
}

contract WideTree {
  t: Branch;

  init() {
    self.t = Branch{a: Leaf{x:1}, b: Leaf{x:2}, c: Leaf{x:3}};
  }
}