struct Nested {
  a: Int;
  b: Bool;
}

contract TestContract {
  f1: Int;
  f2: Bool;
  f3: String;
  s: Nested;

  init() {
    self.f1=1; self.f2=false; self.f3="X";
    self.s = Nested{ a:2, b:true };
  }
}