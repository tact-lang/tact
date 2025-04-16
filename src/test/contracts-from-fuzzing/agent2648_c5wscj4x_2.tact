struct Inner1 {
  f1: Int;
  f2: Bool;
}

struct Inner2 {
  g1: Int?;
  g2: Bool;
}

struct MainStruct {
  inner_one: Inner1;
  inner_two: Inner2;
  optional_inner1: Inner1?;
  optional_inner2: Inner2?;
  flag: Bool;
}

contract ComplexStorage {
  state: MainStruct;

  init() {
    self.state = MainStruct{
      inner_one: Inner1{ f1: 5, f2: true },
      inner_two: Inner2{ g1: null, g2: false },
      optional_inner1: null,
      optional_inner2: null,
      flag: true
    };
  }
}