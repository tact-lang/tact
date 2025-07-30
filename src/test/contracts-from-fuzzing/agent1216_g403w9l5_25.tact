struct TupleOne {
  a: Int;
}

contract TupleOrder {
  t1: TupleOne;
  t2: TupleOne;
  b: Bool;

  init() {
    self.t1 = TupleOne{a:1};
    self.t2 = TupleOne{a:2};
    self.b = true;
  }
}