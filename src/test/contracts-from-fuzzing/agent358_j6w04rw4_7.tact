struct A {
  x: Int;
  b: Bool;
}

struct B {
  a: A;
  s: String;
}

contract SwapOrder {
  x: Int;
  y: Bool;
  data: B;

  init() {
    self.x = 1;
    self.y = false;
    self.data = B{ a: A{ x:42, b:true }, s: "hi" };
  }
}