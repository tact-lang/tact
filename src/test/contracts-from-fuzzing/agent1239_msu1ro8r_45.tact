struct InnerO {
  f:Int;
}

contract OptionalInits {
  a:InnerO? = null;
  b:InnerO?;

  init(){
    self.b = null;
  }
}