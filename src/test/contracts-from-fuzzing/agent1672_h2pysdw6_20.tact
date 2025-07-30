struct InnerOpt {
  x: Int?;
  b: Bool?;
}

struct OuterOpt {
  s: InnerOpt?;
}

contract NestedOptionals {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ s: null };
    }
}
