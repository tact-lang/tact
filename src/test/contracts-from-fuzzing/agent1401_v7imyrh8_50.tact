struct DeepManyOpts {
  o1: Int?;
  o2: Bool?;
  o3: String?;
  o4: Address?;
  o5: Cell?;
}
contract DeepManyOptsC {
  s: DeepManyOpts;
  init() {
    self.s = DeepManyOpts{ o1:null, o2:true, o3:null, o4:null, o5:emptyCell() };
  }
}