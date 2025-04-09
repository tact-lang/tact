struct Inner {
  a: Int;
  b: Bool;
  c: Int?;
}

struct Middle {
  i1: Inner;
  i2: Inner;
  flag: Bool;
}

struct Outer {
  m: Middle;
  count: Int;
}

contract OptionDeep {
  data: Outer;

  init() {
    self.data = Outer{
      m: Middle{
        i1: Inner{a:1, b:true, c:null},
        i2: Inner{a:2, b:false, c:5},
        flag: true
      },
      count: 999
    };
  }
}
