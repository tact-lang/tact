struct OptMix {
  optInt: Int?;
  optBool: Bool?;
  str: String;
  optStr: String?;
}

contract OptionalMix {
  payload: OptMix;
  init() {
    self.payload = OptMix{optInt:null, optBool:null, str:"", optStr:null};
  }
}
