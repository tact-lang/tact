struct NestedOption {
  inn: Int?;
  boo: Bool;
}

contract DoubleOption {
    optOuter: NestedOption?;

    init() {
        self.optOuter = null;
    }
}