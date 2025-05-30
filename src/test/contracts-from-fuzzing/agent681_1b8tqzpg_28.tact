struct A { x: Int; }
struct B { y: Int; }

struct ABWrap {
  a: A;
  b: B;
}

contract ABFields {
  ab: ABWrap;

  init() {
    self.ab = ABWrap{
      a: A{x:5},
      b: B{y:6}
    };
  }
}