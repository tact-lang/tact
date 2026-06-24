struct Combo1 {
  a: Int;
  b: String;
}

struct Combo2 {
  c: Bool;
  d: Int?;
}

struct Container {
  x: Combo1;
  y: Combo2;
}

contract NestedCombos {
  val: Container;

  init() {
    self.val = Container{
      x: Combo1{a:42, b:"abc"},
      y: Combo2{c:true, d:null}
    };
  }
}
