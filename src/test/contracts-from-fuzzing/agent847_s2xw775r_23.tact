struct InnerOpt {
    n: Int?;
}

struct OuterOpt {
    s: InnerOpt?;
}

contract TwiceNestedOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ s: null };
    }
}