struct OptStruct {
  s: String?;
  i: Int?;
  b: Bool?;
}

contract OptNest {
  v: OptStruct = OptStruct{ s:null, i:null, b:null };

  init() {
    self.v = OptStruct{ s:"ok", i:10, b:true };
  }

  receive() {
    self.v = self.v;
  }
}