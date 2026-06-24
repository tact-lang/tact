struct DeepNested {
  level1: InnerStruct;
}

struct InnerStruct {
  level2: DeeperStruct;
}

struct DeeperStruct {
  value: Int;
  flag: Bool;
}

contract DeepContract {
  val: DeepNested;

  init() {
    self.val = DeepNested{
      level1: InnerStruct{
        level2: DeeperStruct{
          value: 10,
          flag: false
        }
      }
    };
  }
}