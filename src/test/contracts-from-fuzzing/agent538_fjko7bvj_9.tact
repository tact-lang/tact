struct Inner {
  flag: Bool = false;
  num: Int = 123;
}

struct Outer {
  inner1: Inner;
  inner2: Inner;
}

contract MultiNested {
  data: Outer;

  init() {
    self.data = Outer{
      inner1: Inner{ flag:true, num:1 },
      inner2: Inner{ flag:false, num:2 }
    };
  }
}
