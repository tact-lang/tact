struct T1 {
  a: Int;
}

struct T2 {
  b: T1;
}

struct T3 {
  c: T2;
}

contract TestContract {
  val: T3;
  init() {
    self.val = T3{c: T2{b: T1{a: 5}}};
  }
}