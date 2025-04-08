struct InnerTuple {
  a: Int;
  b: Bool;
  c: String;
}

struct OuterTuple {
  aa: InnerTuple;
  bb: InnerTuple;
  cc: InnerTuple;
}

contract TestMultiNested {
  nested: OuterTuple;

  init() {
    self.nested = OuterTuple{
      aa: InnerTuple{ a:1, b:true, c:"x" },
      bb: InnerTuple{ a:2, b:false, c:"y" },
      cc: InnerTuple{ a:3, b:true, c:"z" },
    };
  }
}