struct Params {
  s:String;
  n:Int;
}

contract OptionalStruct {
  p: Params?;

  init() {
    self.p = null;
  }
}
