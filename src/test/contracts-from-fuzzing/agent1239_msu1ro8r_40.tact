struct WrapDefaults {
  f:Int = 5;
}

contract WrapDefaultStruct {
  val:WrapDefaults;

  init(){
    self.val=WrapDefaults{};
  }
}