struct Recurring {
  a: Int;
  b: Int?;
  c: Int;
  d: Int?;
  e: Int;
}

contract RecurTest {
  rec: Recurring;

  init() {
    self.rec = Recurring{
      a: 1,
      b: null,
      c: 3,
      d: null,
      e: 5
    };
  }
}