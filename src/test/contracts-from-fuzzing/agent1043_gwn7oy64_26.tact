struct DefaultsInStructWithInit {
  a: Int = 42;
  b: String = "hello";
}

contract TestContract {
  myField: DefaultsInStructWithInit;

  init() {
    self.myField = DefaultsInStructWithInit{};
  }
}