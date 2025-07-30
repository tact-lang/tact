struct ManyOptionalPrims {
  optInt: Int?;
  optBool: Bool?;
  optCell: Cell?;
  optSlice: Slice?;
  optStr: String?;
}

contract OptPrimFields {
  f: ManyOptionalPrims;
  init() {
    self.f = ManyOptionalPrims{
      optInt:null,optBool:null,optCell:null,optSlice:null,optStr:null
    };
  }
}