// Optional struct as optional field
struct InnerMost { f1: Int; f2: Bool }

struct Container {
  optInner: InnerMost?; 
  id: Int
}

contract OptStructField {
  data: Container;

  init() {
    self.data = Container{
      optInner: null,
      id: 77
    };
  }
}
