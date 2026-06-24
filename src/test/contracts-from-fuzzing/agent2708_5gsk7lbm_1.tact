struct Inner {
  val: Int;
  flag: Bool;
}

contract DeepOptional {
  record: Inner?;
  
  init() {
    self.record = null;
  }
}