struct SOpt {
  d: Int?; 
  s: String?;
}
contract MultiOpt {
  sop: SOpt;
  init() {
    self.sop = SOpt{ d:null, s:"hello"};
  }
}