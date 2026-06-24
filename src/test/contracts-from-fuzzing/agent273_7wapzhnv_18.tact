struct Defaulted {
  a: Int = 1;
  b: Bool = false;
  c: Int?;
  d: Bool? = true;
  e: String = "hello";
}

contract TestContract {
  def: Defaulted;

  init() {
    self.def = Defaulted{
      // test with optional using implicit null default
    };
  }
}