struct Simple1 { a: Int }
struct Simple2 { b: Int }

struct Container {
  s1: Simple1;
  s2: Simple2;
}

contract MultiNested {
  data: Container;

  init() {
    self.data = Container{
      s1: Simple1{a: 1},
      s2: Simple2{b: 2},
    };
  }
}