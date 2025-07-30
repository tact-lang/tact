struct HasBool {
  flag1: Bool;
  flag2: Bool;
  flag3: Bool;
}

contract Test {
  val: HasBool;
  init() {
    self.val = HasBool{flag1:true, flag2:false, flag3:true};
  }
}