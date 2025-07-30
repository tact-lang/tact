struct A {
  f1: Int;
  f2: Bool?;
  f3: String;
}

struct B {
  innerA: A;
  n: Int;
}

contract TestContract {
  data: B;

  init() {
    self.data = B{
      innerA: A{ f1:0, f2:null, f3:"hi" },
      n: 7
    };
  }
}