struct DefaultsNested {
  a: Int = 1;
  b: Bool? = null;
}

contract DefaultsTest {
  s: DefaultsNested;

  init(){
    self.s = DefaultsNested{};
  }
}