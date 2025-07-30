struct InnerA { p: Int; q: Bool; }
struct InnerB { s: String; t: Bool?; }

struct Combined {
  a: InnerA;
  b: InnerB;
  flag: Bool;
}

contract MultiNested {
  val: Combined;

  init() {
    self.val = Combined{
      a: InnerA{ p:2, q:true },
      b: InnerB{ s:"hi", t:null },
      flag: true
    };
  }
}