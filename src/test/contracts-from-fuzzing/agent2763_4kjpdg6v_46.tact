struct OptionalOnly {
  o1:Int?; o2:Int?; o3:Int?; o4:Int?; o5:Int?;
}

contract OptOnlyContract {
  val: OptionalOnly;
  init() {
    self.val = OptionalOnly{
      o1:null,o2:null,o3:null,o4:null,o5:null
    };
  }
}