struct InnerOpt {
    flag: Bool?;
}

struct OuterOpt {
    a: Int;
    inner: InnerOpt?;
}

contract NestedOptionalField {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ a: 42, inner: null };
    }
}