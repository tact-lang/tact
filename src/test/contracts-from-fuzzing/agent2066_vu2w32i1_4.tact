struct DeepOptional {
  opt1: Int?;
  opt2: Bool?;
  sub: SubStruct?;
}

struct SubStruct {
  s1: Int;
  s2: Bool;
}

contract OptionalDeep {
  val: DeepOptional;

  init() {
    self.val = DeepOptional{opt1:null, opt2:false, sub: SubStruct{s1:2, s2:true}};
  }
}