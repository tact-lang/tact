struct CC {
  q: Int;
  w: Bool;
}

struct BB {
  x: Int;
  y: Bool;
  z: CC;
}

struct AA {
  a: Int;
  b: String;
  c: BB;
}

contract NestedComplex {
  param: AA = AA{
    a:1,
    b:"str",
    c: BB{
      x:2,y:true,z:CC{q:3,w:false}
    }
  };

  init() {
    self.param = AA{
      a:10,
      b:"s2",
      c: BB{x:20,y:false,z:CC{q:30,w:true}}
    };
  }
}
