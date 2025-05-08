struct Inner {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
}

struct Outer {
  nested: Inner;
  number: Int;
  flag: Bool;
  opt: Int?;
}

contract DeepTest {
  state: Outer;

  init() {
    self.state = Outer{
      nested: Inner{a:1,b:true,c:null,d:false},
      number: 42,
      flag: true,
      opt: null
    };
  }
}