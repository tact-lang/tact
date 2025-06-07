struct DeepNestLevel3 {
  val: Int;
}

struct DeepNestLevel2 {
  nested3: DeepNestLevel3;
}

struct DeepNestLevel1 {
  nested2: DeepNestLevel2;
}

contract TestContract {
  data: DeepNestLevel1;

  init() {
    self.data = DeepNestLevel1{
      nested2: DeepNestLevel2{
        nested3: DeepNestLevel3{
          val: 123
        }
      }
    };
  }
}