struct Nested {
  a: Int;
  b: Bool;
  c: InnerStruct;
}

struct InnerStruct {
  d: Int;
  e: Bool?;
}

contract TestContract {
  data: Nested;

  init() {
    self.data = Nested{
      a: 1,
      b: true,
      c: InnerStruct{
        d: 2,
        e: null,
      },
    };
  }
}
