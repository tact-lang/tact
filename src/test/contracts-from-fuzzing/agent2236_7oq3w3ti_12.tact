struct A { x: Int }
struct B { y: Int }

contract Compound {
  a: A;
  b: B;
  flag: Bool;
  text: String?;

  init() {
    self.a = A{ x: 1 };
    self.b = B{ y: 2 };
    self.flag = false;
    self.text = null;
  }
}