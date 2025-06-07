struct InnerNested {
  x: Int?;
  y: String;
}

struct OuterNested {
  inner: InnerNested?;
  flag: Bool;
}

contract TestContract {
  st: OuterNested;

  init() {
    self.st = OuterNested{
      inner: InnerNested{
        x: 5,
        y: "data"
      },
      flag: true
    };
  }
}