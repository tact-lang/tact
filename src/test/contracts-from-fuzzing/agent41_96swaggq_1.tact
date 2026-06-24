struct DeepNest {
  a: Int;
  b: Inner1;
}

struct Inner1 {
  c: Bool;
  d: Inner2;
}

struct Inner2 {
  e: String;
  f: Inner3;
}

struct Inner3 {
  g: String;
  h: Bool?;
}

contract DeepNestedTest {
  nest: DeepNest;

  init() {
    self.nest = DeepNest{
      a: 1,
      b: Inner1{
        c: true,
        d: Inner2{
          e: "ok",
          f: Inner3{
            g: "deep",
            h: null
          }
        }
      }
    };
  }
}
