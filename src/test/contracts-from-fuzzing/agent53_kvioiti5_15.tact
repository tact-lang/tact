struct NestedMultiOpt {
  a: Int?;
  b: Bool?;
  c: Int?;
}

struct Container {
  x: NestedMultiOpt;
  y: NestedMultiOpt?;
}

contract NestedOptions {
  field: Container;

  init() {
    self.field = Container{
      x: NestedMultiOpt{a:null,b:true,c:null},
      y: null
    };
  }
}