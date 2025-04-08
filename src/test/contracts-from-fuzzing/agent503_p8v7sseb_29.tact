struct AllDefaults {
  x: Int = 1;
  y: Bool = true;
  s: String = "yes";
}

contract EmptyStructAssign {
  val: AllDefaults;

  init() {
    self.val = AllDefaults{};
  }
}
