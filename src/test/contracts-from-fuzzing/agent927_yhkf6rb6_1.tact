struct DeepNest {
  val1: Int;
  val2: Bool?;
  child: InnerStruct;
}

struct InnerStruct {
  flag: Bool;
  child: LeafStruct;
}

struct LeafStruct {
  number: Int?;
}

contract TestContract {
  state: DeepNest;

  init() {
    self.state = DeepNest{
      val1: 1,
      val2: true,
      child: InnerStruct{
        flag: false,
        child: LeafStruct{
          number: null
        }
      }
    };
  }
}