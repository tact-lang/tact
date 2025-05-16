struct Inner {
  x: Int;
  flag: Bool;
}

contract OptInnerOpt {
  val: Inner?;
  str: String?;

  init() {
    self.val = Inner{x:1,flag:true};
    self.str = "hi";
  }
}