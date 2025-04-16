struct Nested {
  val: Int;
  flag: Bool;
}

contract TestContract {
  nested1: Nested; 
  nested2: Nested; 

  init() {
    self.nested1 = Nested{val: 12, flag: true};
    self.nested2 = Nested{val: 34, flag: false};
  }
}