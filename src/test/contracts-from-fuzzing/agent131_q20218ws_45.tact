struct Inner {
  foo: Int;
  bar: Bool?;
}

contract DefaultedWithComp {
  s: Inner = Inner{ foo:7, bar:null };

  init() {
    self.s = Inner{ foo:99, bar:true };
  }
}