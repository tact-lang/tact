struct Nested {
  a: Int;
  b: Bool;
}

struct DeeplyNested {
  n: Nested;
  flag: Bool?;
  count: Int?;
}

contract TestContract {
  data: DeeplyNested;

  init() {
    self.data = DeeplyNested{
      n: Nested{
        a: 42,
        b: true,
      },
      flag: null,
      count: null,
    };
  }
}