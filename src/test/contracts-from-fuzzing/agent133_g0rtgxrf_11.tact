struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  in1: Inner;
  in2: Inner;
  inOpt: Inner?;
  s1: String;
  s2: String?;
}

contract NestedMany {
  store: Outer;

  init() {
    self.store = Outer{
      in1: Inner{a:1,b:true},
      in2: Inner{a:2,b:false},
      inOpt: null,
      s1: "q",
      s2: null
    };
  }
}
