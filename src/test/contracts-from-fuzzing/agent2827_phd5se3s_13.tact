struct Inner {
  i: Int;
  b: Bool;
}

struct Middle {
  inn: Inner;
}

struct Outer {
  mid: Middle;
}

contract WideDeep {
  o: Outer;
  init() {
    self.o = Outer{mid: Middle{inn: Inner{i:1,b:true}}};
  }
}