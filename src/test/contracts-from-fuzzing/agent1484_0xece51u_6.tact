struct DeepLevel3 {
  n: Int;
}

struct DeepLevel2 {
  inner: DeepLevel3;
  flag: Bool;
}

struct DeepLevel1 {
  level2: DeepLevel2;
  s: String;
}

contract DeepStructs {
  deep: DeepLevel1;

  init() {
    self.deep = DeepLevel1{
      level2: DeepLevel2{
        inner: DeepLevel3{n: 111},
        flag: true
      },
      s: "test"
    };
  }
}