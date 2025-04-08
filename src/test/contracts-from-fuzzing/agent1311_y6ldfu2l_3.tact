struct InnerOpt {
  v: Int?;
}

struct Container {
  a1: Int?;   a2: Int?;   a3: Int?;   a4: Int?;
  a5: Int?;   a6: Int?;   a7: Int?;   a8: Int?;
  a9: Int?;   a10: Int?;  a11: Int?;  a12: Int?;
  inner: InnerOpt?;
}

contract ManyOptionals {
  persistent: Container;

  init() {
    self.persistent = Container{
      a1: null,
      a2: null,
      a3: null,
      a4: null,
      a5: null,
      a6: null,
      a7: null,
      a8: null,
      a9: null,
      a10: null,
      a11: null,
      a12: null,
      inner: InnerOpt{ v: null },
    };
  }
}