struct Compose {
  a: Int;
  b: BInner;
  c: CInner;
}

struct BInner {
  s: String;
}
struct CInner {
  flag: Bool;
}

contract NestedStructs {
  val: Compose;

  init() {
    self.val = Compose{
      a: 7,
      b: BInner{s:"hi"},
      c: CInner{flag:true}
    };
  }
}