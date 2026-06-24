struct Data1 {
  a: Int;
}

struct Data2 {
  b: Bool;
}

struct Combine {
  one: Data1;
  two: Data2;
}

contract MultiEmbed {
  comb: Combine;

  init() {
    self.comb = Combine{
      one: Data1{ a: 1 },
      two: Data2{ b: true }
    };
  }
}