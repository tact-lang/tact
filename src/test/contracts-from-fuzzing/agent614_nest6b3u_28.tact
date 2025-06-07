struct Inner {
  val: Int as uint8;
  name: String;
  flag: Bool;
}

contract SerializeStruct {
  data: Inner;

  init() {
    self.data = Inner{val:11,name:"hi",flag:false};
  }
}