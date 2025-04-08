struct Chain {
  first: Int;
  next: Nested;
}

struct Nested {
  second: Int;
  last: Final;
}

struct Final {
  value: Int;
}

contract TestContract {
  content: Chain;

  init() {
    self.content = Chain{
      first: 1,
      next: Nested{
        second: 2,
        last: Final{ value: 3 }
      }
    };
  }
}