struct BigNested {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Int;
  f: Int?;
}

struct Container {
  nested: BigNested;
  flag: Bool;
  num: Int;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container{
      nested: BigNested{
        a: 1,
        b: true,
        c: null,
        d: false,
        e: 42,
        f: 100
      },
      flag: false,
      num: 5
    };
  }
}