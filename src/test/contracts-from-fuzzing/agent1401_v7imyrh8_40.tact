struct DeepBoolOpt {
  a: Bool?;
  b: Bool?;
  c: Bool?;
  d: Bool?;
  e: Bool?;
}

contract DeepBoolOptsContract {
  val: DeepBoolOpt;

  init() {
    self.val = DeepBoolOpt{a:null,b:true,c:null,d:true,e:null};
  }
}