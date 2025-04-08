struct LargeNested {
  x0: Int;
  x1: Int;
  x2: Int;
  x3: Int;
  x4: Int;
}

struct Container {
  nested: LargeNested;
  flag: Bool;
}

contract LargeNestContract {
  c: Container;

  init() {
    self.c = Container{
      nested: LargeNested{
        x0:0, x1:1, x2:2, x3:3, x4:4
      },
      flag: true,
    };
  }
}