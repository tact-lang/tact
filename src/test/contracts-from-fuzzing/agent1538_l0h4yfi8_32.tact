struct HasManyNested {
  a: Inner?;
  b: Inner;
  c: Inner?;
}

struct Inner {
  f1: Int;
  f2: Bool;
}

contract Test {
  storage: HasManyNested;

  init() {
    self.storage = HasManyNested{
      a: null,
      b: Inner{ f1:1, f2:true },
      c: Inner{ f1:2, f2:false }
    };
  }
}