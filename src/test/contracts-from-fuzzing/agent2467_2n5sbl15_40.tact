struct OptInner { 
  x: Int? = null; 
  y: Bool? = null; 
}

contract AllOptionDefault {
  val: OptInner = OptInner{};
  init() {}
}