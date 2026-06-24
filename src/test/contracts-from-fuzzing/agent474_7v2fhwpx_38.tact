struct Inner1 {
  a: Int;
}
struct Inner2 {
  b: Int?;
}
struct Combo {
  f1: Inner1;
  f2: Inner2;
}

contract Test {
  val: Combo;
  init() {
    self.val = Combo{ f1: Inner1{a:42}, f2: Inner2{b:null} };
  }
}
