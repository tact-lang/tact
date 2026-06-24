struct Base {
  a: Int;
}

struct Mid1 {
  f: Base;
}

struct Mid2 {
  f: Base;
}

struct Top {
  x: Mid1;
  y: Mid2;
}

contract DuplicateBase {
  val: Top;

  init() {
    self.val = Top{
      x: Mid1{f: Base{a:1}},
      y: Mid2{f: Base{a:2}}
    };
  }
}