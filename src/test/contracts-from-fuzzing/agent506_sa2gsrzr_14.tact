struct OptPrim {
  a: Int?;
  b: Bool?;
}

struct Container {
  inner: OptPrim;
  flag: Bool;
}

contract OptPrimitiveNested {
  data: Container;

  init() {
    self.data = Container{
      inner: OptPrim{a:null, b:true},
      flag: false
    };
  }
}