struct OptionalDeep {
  l1: OptionalLevel1?;
}

struct OptionalLevel1 {
  l2: OptionalLevel2?;
}

struct OptionalLevel2 {
  l3: OptionalLevel3?;
}

struct OptionalLevel3 {
  val: String?;
}

contract TestContract {
  nestedOpt: OptionalDeep;
  init() {
    self.nestedOpt = OptionalDeep{
      l1: OptionalLevel1{
        l2: OptionalLevel2{
          l3: OptionalLevel3{
            val: null
          }
        }
      }
    };
  }
}