struct Inner {
  a: Int = 4;
  b: Bool = false;
}

struct Outer {
  i1: Inner;
  i2: Inner;
  extra: String = "data";
}

struct Envelope {
  out: Outer;
  count: Int = 99;
}

contract DefaultsOptional {
  state: Envelope = Envelope{
    out: Outer{
      i1: Inner{a:1,b:true},
      i2: Inner{a:2,b:true},
      extra:"hi"
    },
    count:100
  };
  init() {}
}