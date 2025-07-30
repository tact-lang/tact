struct Leaf {
  score: Int?; 
  note: String?; 
}
struct Branch {
  leaf: Leaf?;
}
struct Tree {
  branch: Branch?;
}

contract TestContract {
  data: Tree;

  init() {
    self.data = Tree{
      branch: Branch{
        leaf: Leaf{
          score: 42,
          note: "ok"
        }
      }
    };
  }
}