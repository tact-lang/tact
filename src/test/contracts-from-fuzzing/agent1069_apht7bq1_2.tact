struct Leaf {
  x: Int;
  name: String?;
}

struct Mid {
  flag: Bool;
  leaf: Leaf?;
}

struct Root {
  id: Int;
  mid: Mid?;
}

contract DeepOptional {
  root: Root?;

  init() {
    self.root = Root{
      id: 1,
      mid: Mid{
        flag: true,
        leaf: Leaf{
          x: 99,
          name: "Deep"
        }
      }
    };
  }
}