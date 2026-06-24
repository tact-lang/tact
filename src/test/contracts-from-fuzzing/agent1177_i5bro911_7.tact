struct DefaultStruct {
  a: Int = 1;
  b: Bool?;
  c: String = "default";
}

contract DefaultsInStruct {
  item: DefaultStruct;
  
  init() {
    self.item = DefaultStruct{ };
  }
}
