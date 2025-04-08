struct InnerOptionals {
  intOpt: Int?;
  boolOpt: Bool?;
}

struct OuterOptionals {
  innerOpt: InnerOptionals?;
}

contract NestedOpts {
  st: OuterOptionals;

  init() {
    self.st = OuterOptionals{innerOpt: null};
  }
}