struct DeepOptNest {
  nest1: OptL1?;
}
struct OptL1 {
  nest2: OptL2?;
}
struct OptL2 {
  nest3: OptL3?;
}
struct OptL3 {
  x: Int;
}

contract DeepOptStruct {
  data: DeepOptNest;

  init() {
    self.data = DeepOptNest{
      nest1: OptL1{
        nest2: OptL2{
          nest3: OptL3{
            x: 123
          }
        }
      }
    };
  }
}