struct InnerOpt {
    x: Int?;
}

struct MiddleOpt {
    inner: InnerOpt?;
}

contract NestedOptionals {
    data: MiddleOpt?;

    init() {
        self.data = MiddleOpt{ inner: null };
    }
}
