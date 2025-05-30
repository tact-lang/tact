struct Inner {
  a: Int;
  b: Bool;
}

struct Outer {
  nested1: Inner;
  nested2: Inner;
}

contract MultiNestedSameType {
  storage: Outer;

  init() {
    self.storage=Outer{
      nested1: Inner{a:1,b:true},
      nested2: Inner{a:2,b:false}
    };
  }
}