struct OptionalsStruct {
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
  optAddr: Address?;
}

contract ManyOptionals {
  data: OptionalsStruct;

  init() {
    self.data = OptionalsStruct{
      optInt:null,optBool:null,optStr:null,optAddr:null
    };
  }
}