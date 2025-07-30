struct Middle {
  inner1: Int;
  inner2: Bool;
}

struct Outer {
  m1: Middle;
  m2: Middle;
}

contract TestContract {
  val: Outer;

  init() {
    self.val = Outer{
      m1: Middle{inner1:1, inner2:true},
      m2: Middle{inner1:2, inner2:false}
    };
  }
}