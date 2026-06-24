struct Leaf {
  msg: String?;
}

struct Branch {
  val: Int;
  leaf: Leaf;
}

struct Node {
  label: String;
  branch: Branch?;
}

contract DeeplyNested {
  n: Node;

  init() {
    self.n = Node{
      label: "root",
      branch: Branch{
        val: 123,
        leaf: Leaf{
          msg: null
        }
      }
    };
  }
}