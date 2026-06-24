struct DeepLevel3 {
  val3: Int;
}

struct DeepLevel2 {
  val2: DeepLevel3;
}

struct DeepLevel1 {
  val1: DeepLevel2;
}

contract DeepNested {
  deepField: DeepLevel1;

  init() {
    self.deepField = DeepLevel1{
      val1: DeepLevel2{
        val2: DeepLevel3{ val3: 42 }
      }
    };
  }
}
