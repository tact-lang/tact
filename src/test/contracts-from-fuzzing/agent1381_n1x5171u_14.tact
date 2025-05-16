struct Z {
  u: Int?;
  v: String?;
}

struct Y {
  w: Bool;
  z: Z?;
}

struct X {
  y: Y;
}

contract OptNestedComplex {
  val: X;

  init() {
    self.val = X{
      y: Y{
        w:false,
        z:null
      }
    };
  }
}