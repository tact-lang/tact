message(21) M {
  x: Int;
}

struct C {
  msg: M?;
  flag: Bool;
}

contract Test {
  data: C;

  init() {
    self.data = C{
      msg: null,
      flag: true
    };
  }
}
