struct BigNest {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
  e: Int;
  f: Int;
  g: Int;
  h: Int;
}

struct Wrap {
  x: BigNest;
  y: BigNest;
}

contract LotsNested {
  w: Wrap;

  init() {
    self.w = Wrap{
      x: BigNest{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8},
      y: BigNest{a:10,b:20,c:30,d:40,e:50,f:60,g:70,h:80}
    };
  }
}
