struct DeepLevel3 {
  flag: Bool;
}

struct DeepLevel2 {
  nested: DeepLevel3;
  count: Int;
}

struct DeepLevel1 {
  nested: DeepLevel2;
}

contract TestContract {
  data: DeepLevel1;

  init() {
    self.data = DeepLevel1{
      nested: DeepLevel2{
        nested: DeepLevel3{flag: true},
        count: 99
      }
    };
  }
}