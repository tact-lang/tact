struct ComplexOptSer {
  optNum: Int? as uint64;
  optBool: Bool?;
  optAddr: Address?;
}

contract UseComplexOptSer {
  data: ComplexOptSer;
  init() {
    self.data = ComplexOptSer{optNum:null, optBool:null, optAddr:null};
  }
}
