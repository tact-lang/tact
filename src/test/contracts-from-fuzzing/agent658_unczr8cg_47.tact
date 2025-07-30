struct BoolNest {
  b1: Bool;
  b2: Bool;
}

struct Container {
  c1: BoolNest;
  c2: BoolNest;
}

contract NestedManyBools {
  data: Container;

  init() {
    self.data = Container{
      c1: BoolNest{b1:true, b2:true},
      c2: BoolNest{b1:false, b2:false}
    };
  }
}