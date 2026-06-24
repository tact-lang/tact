struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NestedOptionals {
    s: OuterOpt?;

    init() {
        self.s = null;
    }
}