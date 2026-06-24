struct Leaf {
  flag: Bool;
  count: Int;
  label: String;
  nickname: String?;
}

struct Branch {
  child: Leaf;
}

struct Trunk {
  up: Branch;
}

contract Tree {
  root: Trunk;

  init() {
    self.root = Trunk{
      up: Branch{
        child: Leaf{
          flag: true,
          count: 77,
          label: "core",
          nickname: null
        }
      }
    };
  }
}