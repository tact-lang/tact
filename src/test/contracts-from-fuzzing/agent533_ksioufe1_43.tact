struct CombInner {
  a: Int;
  b: Bool;
}

struct CombOuter {
  i: CombInner;
  j: CombInner?;
}

contract CombMix {
  val: CombOuter;
  init() {
    self.val = CombOuter{
      i: CombInner{a:1,b:true},
      j: null
    };
  }
}