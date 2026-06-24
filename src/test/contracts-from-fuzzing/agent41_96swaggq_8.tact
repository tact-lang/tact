struct OptNested {
  inner: InnerOpt?;
}

struct InnerOpt {
  val: Int;
  flag: Bool?;
}

contract NestedOptionals {
  st: OptNested;

  init() {
    self.st = OptNested{
      inner: InnerOpt{
        val: 1,
        flag: null
      }
    };
  }
}
