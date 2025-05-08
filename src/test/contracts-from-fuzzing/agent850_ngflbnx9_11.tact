struct A {
  f1: Int;
  f2: String;
  f3: Bool?;
}

struct B {
  sub: A;
}

contract Defaults {
  data: B;
  
  init() {
    self.data = B{
      sub: A{
        f1: 0,
        f2: "abc",
        f3: null
      }
    };
  }
}
