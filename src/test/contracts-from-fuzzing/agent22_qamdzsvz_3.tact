struct NestedOptionals {
  nestedOpt: InnerOpt?;
}

struct InnerOpt {
  a: Int?;
  b: Bool?;
}

contract TestNestedOptionals {
  data: NestedOptionals;

  init() {
    self.data = NestedOptionals{ nestedOpt: null };
  }
}