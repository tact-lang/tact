struct DefTest {
  a: Int;
  b: Int = 5;
  c: Bool = true;
  d: String = "x";
  e: Int?; // default null
}

contract Test {
  dt: DefTest;
  init() {
    self.dt = DefTest{ a:1, e:null };
  }
}