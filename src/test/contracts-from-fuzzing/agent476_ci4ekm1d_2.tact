struct InnerMost {
  z: Int;
}

struct Mid {
  nested: InnerMost;
}

struct Outer {
  wrap: Mid;
}

contract MultiNested {
  obj: Outer;

  init() {
    self.obj = Outer{ wrap: Mid{ nested: InnerMost{ z: 1 } } };
  }
  
  receive() {
    let deeper = self.obj.wrap.nested.z;
  }
}