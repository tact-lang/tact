struct OptStruct {
  val: Int?;
  flag: Bool?;
}

contract ManyOptStructs {
  s1: OptStruct;
  s2: OptStruct;
  s3: OptStruct;

  init() {
    self.s1 = OptStruct{ val: 1, flag: null };
    self.s2 = OptStruct{ val: null, flag: false };
    self.s3 = OptStruct{ val: 42, flag: true };
  }
}
