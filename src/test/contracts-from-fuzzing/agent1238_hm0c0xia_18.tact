struct Low {
  a: Int?;
  b: Bool?;
}

struct Mid {
  low: Low;
  m: Int = 5;
}

struct High {
  mid: Mid;
  flag: Bool = false;
}

contract ManyDefaults {
  data: High;
  init() {
    self.data = High{
      mid: Mid{
        low: Low{},
        m: 7
      },
      flag: true
    };
  }
}