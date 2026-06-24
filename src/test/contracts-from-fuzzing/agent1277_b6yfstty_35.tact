struct Bottom {
  foo: Int = 7;
  bar: Bool? = null;
}

struct Mid {
  bot: Bottom?;
  flag: Bool = true;
}

struct Top {
  mid: Mid?;
  number: Int;
}

contract TestContract {
  storage: Top;
  init() {
    self.storage = Top{
      mid: null,
      number: 99
    };
  }
}