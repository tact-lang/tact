struct OptionalsDefault {
  x: Int? = null;
  y: Address? = null;
}

contract OptDefaultsContract {
  val: OptionalsDefault;

  init() {
    self.val = OptionalsDefault{};
  }
}