struct OptionalStruct {
  f1: Int?; f2: Bool?; f3: Cell?; f4: Slice?; f5: Address?; f6: String?;
}

contract Test {
  data: OptionalStruct;
  init() {
    self.data = OptionalStruct{
      f1:null, f2:null, f3:null, f4:null, f5:null, f6:null
    };
  }
}