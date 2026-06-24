struct Defaults {
  a: Int = 10;
  b: Int = 20;
  c: Int?;
}

contract Defaulted {
  val: Defaults;

  init() {
    self.val = Defaults{ a:1, b:2, c:null };
  }
}