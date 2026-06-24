struct InnerMost {
  num: Int;
}

struct MiddleMost {
  innerMost: InnerMost;
}

struct OuterMost {
  middleMost: MiddleMost;
}

contract SerializeLayers {
  layer: OuterMost;

  init() {
    self.layer = OuterMost{
      middleMost: MiddleMost{
        innerMost: InnerMost{ num: 42 }
      }
    };
  }
}