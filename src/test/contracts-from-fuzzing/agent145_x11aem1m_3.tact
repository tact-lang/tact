struct Nested {
  value: Int?;
}

struct Container {
  first: Nested;
  second: Nested;
  third: Nested;
}

contract OptRec {
  storage: Container;
  init() {
    self.storage = Container{
      first: Nested { value: 10 },
      second: Nested { value: null },
      third: Nested { value: 12345 }
    };
  }
}