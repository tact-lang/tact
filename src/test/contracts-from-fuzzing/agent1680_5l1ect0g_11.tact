struct Leaf {
  flag: Bool;
  number: Int;
}

struct Branch {
  leaf1: Leaf;
  leaf2: Leaf;
}

struct Root {
  branch1: Branch;
  branch2: Branch;
}

contract TestContract {
  data: Root;

  init() {
    self.data = Root{
      branch1: Branch{leaf1: Leaf{flag:true,number:1}, leaf2: Leaf{flag:false, number:2}},
      branch2: Branch{leaf1: Leaf{flag:true,number:3}, leaf2:Leaf{flag:false, number:4}}
    };
  }
}
