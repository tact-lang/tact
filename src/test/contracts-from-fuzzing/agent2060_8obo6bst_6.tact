struct Inner {
  foo: Int;
  bar: Bool;
}

struct Container {
  i1: Inner;
  i2: Inner;
  i3: Inner;
  i4: Inner;
  i5: Inner;
}

contract ManyNestedStructs {
  c: Container;
  init() {
    self.c = Container{
      i1: Inner{foo:1, bar:true},
      i2: Inner{foo:2, bar:false},
      i3: Inner{foo:3, bar:true},
      i4: Inner{foo:4, bar:false},
      i5: Inner{foo:5, bar:true}
    };
  }
}