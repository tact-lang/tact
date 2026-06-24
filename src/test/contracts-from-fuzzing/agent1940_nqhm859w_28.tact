struct InnerOpt {
    f: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalNestedOptional {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ inner: null };
    }
}