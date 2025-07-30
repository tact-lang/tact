struct Inner {
  val: Int;
}

contract AssignTwice {
  i: Inner;

  init(){
    self.i = Inner{val:1};
    self.i = Inner{val:2};
  }
}