struct NestedDeep {
  a: Bool;
  b: NestedDeeper;
}

struct NestedDeeper {
  c: Int;
  d: NestedDeepest;
}

struct NestedDeepest {
  e: Bool;
  f: Int;
}

contract ManyNest {
  val: NestedDeep;

  init() {
    self.val = NestedDeep{
      a: true,
      b: NestedDeeper{
        c: 42,
        d: NestedDeepest{e: false, f: 7}
      }
    };
  }
}