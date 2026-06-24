struct Leaf { val: Int; }

struct S5 {
  l1: Leaf;
  l2: Leaf;
  l3: Leaf;
  l4: Leaf;
  l5: Leaf;
}

contract ManyLeaves {
  val: S5;
  init() {
    self.val = S5{
      l1:Leaf{val:1}, l2:Leaf{val:2}, l3:Leaf{val:3}, l4:Leaf{val:4}, l5:Leaf{val:5}
    };
  }
}