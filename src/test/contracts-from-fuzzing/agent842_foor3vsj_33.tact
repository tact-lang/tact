struct DefaultsOpt {
  a:Int?=null; b:Bool?=null; c:String?=null;
}

contract StructWithOptDefaults {
  data: DefaultsOpt;

  init() {
    self.data = DefaultsOpt{};
  }

  receive() {
    let _=self.data;
  }
}