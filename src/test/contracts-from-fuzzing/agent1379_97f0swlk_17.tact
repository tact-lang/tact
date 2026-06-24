struct Tuple {
  a: Int;
  b: Bool;
  c: Address;
  d: String;
  e: Cell;
}

contract TupleCombo {
  t1: Tuple;
  t2: Tuple;
  t3: Tuple;

  init() {
    let tmp = Tuple{
      a: 1, b: true, c: myAddress(), d: "hello", e: emptyCell()
    };
    self.t1 = tmp;
    self.t2 = tmp;
    self.t3 = tmp;
  }
}
