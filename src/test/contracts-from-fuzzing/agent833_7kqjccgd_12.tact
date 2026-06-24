struct DeepOptionsOK { 
  nested: OptionLevel1?;
}

struct OptionLevel1 {
  nested: OptionLevel2?;
}

struct OptionLevel2 {
  nested: OptionLevel3?;
}

struct OptionLevel3 {
  val: Int?;
}

contract DeepOptContract {
  storage: DeepOptionsOK;

  init() {
    self.storage = DeepOptionsOK{
      nested: OptionLevel1{
        nested: OptionLevel2{
          nested: OptionLevel3{
            val: 10
          }
        }
      }
    };
  }
}