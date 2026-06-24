struct Middle {
  a: Int;
  b: Bool;
}

struct Top {
  m1: Middle;
  m2: Middle;
  maybeMid: Middle?;
}

contract MultiNested {
  storage: Top;

  init() {
    self.storage = Top{
      m1: Middle{a:1, b:true},
      m2: Middle{a:2, b:false},
      maybeMid: null,
    };
  }
}