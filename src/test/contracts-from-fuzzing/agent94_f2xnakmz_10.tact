struct InnerOpt {
  x: Int?;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract DeepOptionals {
  data: OuterOpt;

  init() {
    self.data = OuterOpt{
      inner: InnerOpt{ x: 5 }
    };
  }
}