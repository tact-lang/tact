struct Combo {
  n: Int;
  b: Bool;
  s: String;
}

contract TestContract {
  combo: Combo;
  init() {
    self.combo = Combo{ n: 55, b: true, s: "combo" };
  }
}