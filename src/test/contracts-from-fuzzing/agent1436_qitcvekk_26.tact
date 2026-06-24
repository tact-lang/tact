struct MostInner {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

struct Middle {
  inner: MostInner;
}

struct Outer {
  nested: Middle;
}

contract TestContract {
  payload: Outer;

  init() {
    self.payload = Outer{
      nested: Middle{
        inner: MostInner{
          foo: null,
          bar: null,
          baz: null
        }
      }
    };
  }
}