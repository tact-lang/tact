struct Defaults {
  a: Int = 0;
  b: Bool = false;
  c: String = "";
}

contract DefaultsContract {
  val: Defaults;

  init() {
    self.val = Defaults{};
  }
}