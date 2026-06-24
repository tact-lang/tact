struct ManyNestedOptionals {
  a: Int?;
  b: String?;
  c: InnerOne?;
}

struct InnerOne {
  d: Bool?;
  e: String;
  f: InnerTwo?;
}

struct InnerTwo {
  g: Int;
  h: Bool?;
}

contract MultiOptTest {
  s: ManyNestedOptionals;

  init() {
    self.s = ManyNestedOptionals{
      a: null,
      b: "hello",
      c: InnerOne{
        d: true,
        e: "test",
        f: InnerTwo{
          g: 9,
          h: null
        }
      }
    };
  }
}
