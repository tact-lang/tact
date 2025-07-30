// Optional struct default null
struct MyStruct {
  v: Int;
}

contract OptStructDefault {
  bar: MyStruct? = null;
  init() {
    self.bar = null;
  }
}