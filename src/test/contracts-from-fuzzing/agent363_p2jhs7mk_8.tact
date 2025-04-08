struct Defaults {
  a: Int = 1;
  b: Bool = true;
  s: String = "hey";
  o: Int?; // default is null
}

contract TestContract {
  vals: Defaults;

  init() {
    self.vals = Defaults{};
  }
}