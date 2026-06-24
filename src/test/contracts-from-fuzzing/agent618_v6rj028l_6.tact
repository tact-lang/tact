struct BigNested {
  a: Int;
  b: Inner1;
}

struct Inner1 {
  x: Int;
  y: Inner2;
}

struct Inner2 {
  q: Int;
  r: Inner3;
}

struct Inner3 {
  foo: Int?;
  bar: Bool;
}

contract DeepOpt {
  state: BigNested;

  init() {
    self.state = BigNested{
      a: 1,
      b: Inner1{
        x: 2,
        y: Inner2{
          q: 3,
          r: Inner3{
            foo: null,
            bar: true
          }
        }
      }
    };
  }
}
