struct Mid {
  val1: Int;
  val2: Bool?;
}

struct Top {
  a: Int;
  mid: Mid;
  txt: String?;
}

contract OptionalMiddle {
  data: Top;

  init() {
    self.data = Top{
      a: 5,
      mid: Mid{val1:42, val2:null},
      txt: null
    };
  }
}