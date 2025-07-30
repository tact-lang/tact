struct Inner {
  a: Int;
  b: Bool?;
}

struct Wrapper {
  inner1: Inner;
  inner2: Inner;
}

contract MultiNested {
  d: Wrapper;

  init() {
    self.d = Wrapper{
      inner1: Inner{a:1,b:null},
      inner2: Inner{a:2,b:true},
    };
  }
}