struct Deep {
  val: Int;
}

struct Middle {
  nestedOpt: Deep?;
}

struct Top {
  nestedMidOpt: Middle?;
}

contract Test {
  top: Top;

  init() {
    self.top = Top{ nestedMidOpt: null };
  }
}