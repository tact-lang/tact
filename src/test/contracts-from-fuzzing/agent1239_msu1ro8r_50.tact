struct XInner {
  val:Int;
}

contract OptionalAssign {
  s:XInner?;

  init(){
    self.s=XInner{val:11};
  }
}