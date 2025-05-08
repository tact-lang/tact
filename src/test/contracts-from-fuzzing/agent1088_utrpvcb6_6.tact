struct SBase {
  a: Int;
}

struct SMid {
  base: SBase;
  b: Int;
}

struct STop {
  mid: SMid;
  c: Int;
}

contract ChainNested {
  val: STop;

  init() {
    self.val = STop{mid: SMid{base: SBase{a: 1}, b: 2}, c:3};
  }
}
