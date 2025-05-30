struct InnerMost {
  z: Int;
}

struct Mid {
  m: InnerMost?;
}

struct Outer {
  o: Mid?;
}

contract OptionalLayers {
  nestedOpt: Outer? = null;
  
  init() {
    self.nestedOpt = Outer{
      o: Mid{
        m: InnerMost{ z: 321 }
      }
    };
  }
}