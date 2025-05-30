struct WrapBool {
  b: Bool;
}

contract BoolHolder {
  val: WrapBool;
  init() {
    self.val = WrapBool{ b:true };
  }
}