// struct with deeply nested optional subfields inside nested struct layers
struct Leaf {
  val: Int?;
}

struct Branch {
  leaf: Leaf;
  marker: Bool;
}

struct Tree {
  branch: Branch;
  note: String;
}

contract Forest {
  t: Tree;

  init() {
    self.t = Tree{
      branch: Branch{
        leaf: Leaf{ val: null },
        marker: true
      },
      note: "hi"
    };
  }
}