struct HasString {
  text: String;
  num: Int;
}

contract NestedStringStruct {
  st: HasString;
  
  init() {
    self.st = HasString{ text: "hello", num: 11 };
  }
}