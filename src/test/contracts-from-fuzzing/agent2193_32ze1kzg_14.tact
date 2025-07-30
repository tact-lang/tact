struct DefaultStruct {
  i: Int = 5;
  b: Bool = true;
  s: String = "hello";
}

contract TestContract {
  def: DefaultStruct;

  init() {
    self.def = DefaultStruct{};
  }
}