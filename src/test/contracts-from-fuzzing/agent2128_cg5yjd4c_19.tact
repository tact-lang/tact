struct Outermost {
  v: Int;
  sub: Middle?;
}

struct Middle {
  val: Int?;
  sub2: InnerMost?;
}

struct InnerMost {
  deepVal: String?;
}

contract SparseNestedOpt {
  dat: Outermost;

  init() {
    self.dat = Outermost{
      v: 5,
      sub: null
    };
  }
}