struct Bottom {
  a: Int;
  b: Bool;
}

struct Middle {
  c: String;
  inner: Bottom;
}

struct Top {
  d: Cell;
  mid: Middle;
}

contract ComplexNested {
  t: Top;

  init() {
    self.t = Top{
      d: emptyCell(),
      mid: Middle{
        c: "hi",
        inner: Bottom{a:42, b:false}
      }
    };
  }
}
