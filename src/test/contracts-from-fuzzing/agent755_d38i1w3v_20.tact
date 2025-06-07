struct InnerOpt {
  x: Int?;
}

struct OuterOpt {
  y: InnerOpt;
}

contract OptInStruct {
  data: OuterOpt;

  init() {
    self.data = OuterOpt{ y: InnerOpt{ x: null } };
  }
}