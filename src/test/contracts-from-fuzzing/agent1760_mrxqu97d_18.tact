struct InnerMost {
  x: Int;
}

struct MiddleLevel {
  inn: InnerMost;
  y: Int;
}

struct OuterMost {
  mid: MiddleLevel;
  z: Int?;
}

contract DeepAssign {
  thing: OuterMost;

  init() {
    self.thing = OuterMost{
      mid: MiddleLevel{ inn: InnerMost{x:1}, y:2 },
      z: null
    };
  }
}