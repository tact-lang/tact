struct T1 { a: Int; }
struct T2 { t1: T1; }
struct T3 { t2: T2; }

contract NullableOuter {
  maybe: T3?;

  init() {
    self.maybe = null;
  }
}