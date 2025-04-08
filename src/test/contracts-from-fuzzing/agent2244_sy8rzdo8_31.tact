struct Inner {
  foo: Int;
  bar: Bool;
  baz: String?;
}

struct Contain {
  a: Inner;
  b: Inner;
}

contract StructArrayEmul {
  storage: Contain;
  
  init() {
    self.storage = Contain{
      a: Inner{foo:1,bar:true,baz:null},
      b: Inner{foo:2,bar:false,baz:null}
    };
  }
}
