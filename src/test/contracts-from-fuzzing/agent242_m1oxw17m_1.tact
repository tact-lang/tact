struct DeepNestLevel3 {
  leaf1: Int;
  leaf2: Bool;
}

struct DeepNestLevel2 {
  middle1: String;
  middle2: DeepNestLevel3;
}

struct DeepNestLevel1 {
  root1: Bool;
  nested: DeepNestLevel2;
}

contract TestContract {
  data: DeepNestLevel1;

  init() {
    self.data = DeepNestLevel1{
      root1: true,
      nested: DeepNestLevel2{
        middle1: "test",
        middle2: DeepNestLevel3{
          leaf1: 123,
          leaf2: false,
        },
      },
    };
  }
}