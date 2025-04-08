struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  in1: Inner;
  flag: Bool;
  txt: String;
}

struct Wrap {
  o1: Outer;
  o2: Outer;
}

contract ManyNest {
  w: Wrap;

  init() {
    self.w = Wrap{
      o1: Outer{
        in1: Inner{a:1,b:true},
        flag: false,
        txt: "x",
      },
      o2: Outer{
        in1: Inner{a:2,b:false},
        flag: true,
        txt: "y",
      },
    };
  }
}