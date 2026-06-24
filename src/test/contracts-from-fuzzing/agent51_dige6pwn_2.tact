struct Deep {
  foo: Int;
  bar: Bool;
  baz: String;
  opt: Bool?;
}

struct Middle {
  num: Int;
  d: Deep;
}

struct Wrapper {
  m: Middle;
}

contract Test {
  field: Wrapper;
  init() {
    self.field = Wrapper{
      m: Middle{
        num: 42,
        d: Deep{foo:1, bar:true, baz:"x", opt:null}
      }
    };
  }
}