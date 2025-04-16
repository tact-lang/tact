struct A {
  x: Int;
}

struct B {
  y: Int;
}

contract ManyFieldsTest {
  a: A;
  b: B;
  val1: Int = 1;
  flag: Bool = true;
  text: String = "hi";

  init() {
    self.a = A{ x: 10 };
    self.b = B{ y: 20 };
    self.val1 = 30;
    self.flag = false;
    self.text = "bye";
  }
}