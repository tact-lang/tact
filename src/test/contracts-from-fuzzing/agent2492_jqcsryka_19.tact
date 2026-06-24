struct Tail {
  a: Int;
  b: Bool;
}

contract OrderTest {
  f3: Tail;
  f2: Int;
  f1: Bool;

  init() {
    self.f1 = true;
    self.f2 = 10;
    self.f3 = Tail{a:5,b:false};
  }
}