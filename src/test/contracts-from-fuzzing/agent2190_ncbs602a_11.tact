struct StructOne {
  a: Int;
}

struct StructTwo {
  b: Int;
}

struct Container {
  s1: StructOne;
  s2: StructTwo;
}

contract MultipleStructsFields {
  storage: Container;

  init() {
    self.storage = Container{
      s1: StructOne{a:1},
      s2: StructTwo{b:2}
    };
  }
}