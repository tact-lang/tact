struct SDeep {
  l1:Int;
  l2:Int;
  next:SDeeper;
}

struct SDeeper {
  x:Int;
  y:Int;
}

contract StructCrossReference {
  field:SDeep;

  init() {
    self.field = SDeep{ l1:1, l2:2, next: SDeeper{ x:3,y:4} };
  }
}