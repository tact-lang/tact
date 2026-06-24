struct ExprDefaults {
  a: Int = 5 + 3;
  b: Bool = !false;
}

contract ExprDefaultContract {
  data: ExprDefaults;

  init() {
    self.data = ExprDefaults{};
  }
}
