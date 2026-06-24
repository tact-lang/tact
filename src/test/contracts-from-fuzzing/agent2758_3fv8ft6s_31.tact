struct S {
  x: Int;
  y: String;
}

contract TestContract {
  one: S;
  two: S;

  init() {
    self.one = S{ x:0, y:"zero" };
    self.two = S{ x:1, y:"one" };
  }
}