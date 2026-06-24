struct LongNested {
  inner1: Inner1;
  inner2: Inner2;
}

struct Inner1 {
  a: Int;
  b: InnerMost;
}

struct Inner2 {
  c: Bool;
  d: InnerMost;
}

struct InnerMost {
  x: Int;
  y: Bool;
  z: String;
}

contract ComplexPersist {
  state: LongNested;

  init() {
    self.state = LongNested{
      inner1: Inner1{a:1, b:InnerMost{x:1,y:true,z:"z"}},
      inner2: Inner2{c:false, d:InnerMost{x:2,y:false,z:"k"}}
    };
  }
}
