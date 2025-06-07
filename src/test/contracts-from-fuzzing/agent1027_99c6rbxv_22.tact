struct MyStruct { a:Int; b:Int; c:Int; }

contract OptionalStructVar {
  maybe: MyStruct?;

  init() {
    self.maybe = null;
  }
}
