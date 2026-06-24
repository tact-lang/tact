struct Layered {
  top: InnerLayer;
}

struct InnerLayer {
  middle: Deeping;
}

struct Deeping {
  leaf: Int;
}

contract LayeredContract {
  data: Layered;
  init() {
    self.data = Layered{
      top: InnerLayer{
        middle: Deeping{
          leaf: 5
        }
      }
    };
  }
}