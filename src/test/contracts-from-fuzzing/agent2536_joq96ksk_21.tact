// Struct with large number of optionals
struct ManyOpt {
  o1: Int?;
  o2: Bool?;
  o3: String?;
  o4: Cell?;
  o5: Slice?;
  o6: Builder?;
  o7: Address?;
  o8: Int?;
  o9: Bool?;
}

contract ManyOptContract {
  s: ManyOpt;

  init() {
    self.s = ManyOpt{
      o1:null,o2:null,o3:null,o4:null,o5:null,o6:null,o7:null,o8:null,o9:null
    };
  }
}