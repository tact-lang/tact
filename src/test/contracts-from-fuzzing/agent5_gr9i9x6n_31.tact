struct LotsOfOptionals {
  o1: Int?; o2: Bool?; o3: String?; o4: Address?; o5: Cell?;
  o6: Int?; o7: Bool?; o8: String?; o9: Address?; o10: Cell?;
}

contract OptionalsLarge {
  st: LotsOfOptionals;

  init() {
    self.st = LotsOfOptionals{
      o1:null, o2:null, o3:null, o4:null, o5:null,
      o6:null, o7:null, o8:null, o9:null, o10:null
    };
  }

  receive() {
    let _ = self.st.o10;
  }
}
