struct Deep3 {
  leaf: Int;
}

struct Deep2 {
  nested: Deep3;
}

struct Deep1 {
  nested: Deep2;
}

contract DeepNested {
  storage: Deep1;
  init() {
    self.storage = Deep1{
      nested: Deep2{
        nested: Deep3{
          leaf: 99,
        },
      },
    };
  }
}