struct OptionalDeepWrap {
  innerOpt: Int?;
  boolOpt: Bool?;
  strOpt: String?;
  cellOpt: Cell?;
  addrOpt: Address?;
}

struct OptionalPair {
  first: OptionalDeepWrap;
  second: OptionalDeepWrap;
}

contract OptNested {
  s: OptionalPair;

  init() {
    self.s = OptionalPair{
      first: OptionalDeepWrap{ innerOpt:null,boolOpt:true,strOpt:null,cellOpt:null,addrOpt:null },
      second: OptionalDeepWrap{ innerOpt:5,boolOpt:false,strOpt:"s",cellOpt:emptyCell(),addrOpt:myAddress() }
    };
  }
}
