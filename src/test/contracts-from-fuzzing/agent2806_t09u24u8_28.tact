struct X { x: Int; }
struct Y { y: Bool; }
struct Z { z: String; }

struct NestedXY {
  xx: X?;
  yy: Y?;
  zz: Z?;
}

contract OptNestedStruct {
  val: NestedXY;

  init() {
    self.val = NestedXY{
      xx: null,
      yy: Y{y: false},
      zz: null
    };
  }
}