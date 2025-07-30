// optional nested inside optional
struct InnerOpt {
  foo: Int?;
}

contract NestedOpt {
    s: InnerOpt?;

    init() {
        self.s = null;
    }
}