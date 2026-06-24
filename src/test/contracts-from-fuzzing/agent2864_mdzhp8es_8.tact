struct InnerMost {
  x: Int;
}

struct MidLevel {
  m: InnerMost;
}

struct UpperLevel {
  u: MidLevel?;
}

contract OptionalNested {
  state: UpperLevel;

  init() {
    self.state = UpperLevel{ u:null };
  }
}