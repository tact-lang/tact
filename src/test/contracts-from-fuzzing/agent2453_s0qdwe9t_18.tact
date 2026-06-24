struct X {
  a: Int;
  b: String;
}

struct Y {
  c: Bool;
  d: Int?;
}

struct Z {
  x: X;
  y: Y;
}

contract CompoundCompose {
  c: Z;
  init() {
    self.c = Z{
      x: X{a:1,b:"hi"},
      y: Y{c:false,d:null}
    };
  }
}