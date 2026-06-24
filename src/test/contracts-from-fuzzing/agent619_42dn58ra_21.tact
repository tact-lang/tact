struct Inner1 { val: Int; }
struct Inner2 { val: Int; }
struct Inner3 { val: Int; }
struct Inner4 { val: Int; }

struct Agg {
  f1: Inner1;
  f2: Inner2;
  f3: Inner3;
  f4: Inner4;
}

contract MultiInner {
  storage: Agg;

  init() {
    self.storage = Agg{
      f1: Inner1{ val:1 },
      f2: Inner2{ val:2 },
      f3: Inner3{ val:3 },
      f4: Inner4{ val:4 },
    };
  }
}