struct Inner {
  a:Int?;
  b:Bool;
}

contract OptionalNested {
  nested: Inner?;

  init() {
    self.nested = null;
  }
}