struct OuterOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    str: String?;
    val: Int?;
}

contract NestedOptionals {
    outer: OuterOpt;

    init() {
        self.outer = OuterOpt{ inner: null };
    }
}