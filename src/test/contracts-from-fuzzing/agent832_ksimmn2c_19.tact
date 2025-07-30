struct Container {
  field1: Int;
  field2: Middle;
}

struct Middle {
  subfield1: Bool;
  subfield2: Leaf;
}

struct Leaf {
  leaf1: String;
  leaf2: Int;
  leaf3: Bool;
}

contract TreeStorage {
  root: Container;

  init() {
    self.root = Container{
      field1: 1,
      field2: Middle{
        subfield1: false,
        subfield2: Leaf{
          leaf1: "leaf",
          leaf2: 99,
          leaf3: true,
        },
      },
    };
  }
}