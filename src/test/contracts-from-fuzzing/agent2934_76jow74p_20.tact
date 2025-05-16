struct Test1 {
  a: Int;
}

struct Test2 {
  b: Int;
}

contract DuplicateNames {
  t1: Test1;
  t2: Test2;

  init() {
    self.t1 = Test1{a: 1};
    self.t2 = Test2{b: 2};
  }
}