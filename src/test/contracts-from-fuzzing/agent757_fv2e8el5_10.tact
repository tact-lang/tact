struct A1 { f1: Int; f2: Bool; }
struct A2 { f3: Bool; f4: Int; }
struct Container {
  a: A1;
  b: A2;
  flag: Bool;
  num: Int;
}

contract ComplexFields {
  data: Container;

  init() {
    self.data = Container{
      a: A1{ f1: 5, f2: false },
      b: A2{ f3: true, f4: 6 },
      flag: false,
      num: 42
    };
  }
}