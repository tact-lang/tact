struct OptionalNest {
  x: Int?;
  inner: InnerOpt?;
}

struct InnerOpt {
  y: Int?;
  s: String?;
}

contract OptionalWithinOptional {
  data: OptionalNest;

  init() {
    self.data = OptionalNest{
      x:null,
      inner:InnerOpt{y:null,s:null}
    };
  }
}