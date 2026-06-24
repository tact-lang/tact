struct InnerLevel3 {
  val: Int;
}

struct InnerLevel2 {
  lvl3: InnerLevel3;
}

struct InnerLevel1 {
  lvl2: InnerLevel2;
}

contract DeepNestedContract {
  nest: InnerLevel1;

  init() {
    self.nest = InnerLevel1{
      lvl2: InnerLevel2{
        lvl3: InnerLevel3{
          val: 123
        }
      }
    };
  }
}