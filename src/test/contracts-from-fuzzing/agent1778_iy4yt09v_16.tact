struct InnerMost {
  val: Int;
}

struct Middle {
  inner: InnerMost?;
}

struct OuterRec {
  mid: Middle?;
}

contract MultiOptNest {
  data: OuterRec?;

  init() {
    self.data = OuterRec{ mid: Middle{ inner: InnerMost{ val: 55 } } };
  }
}