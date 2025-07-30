struct InnerOpt {
    x: Int?;
}

struct OuterNestedOption {
    wrapped: InnerOpt?;
}

contract NestedOptionalField {
    f: OuterNestedOption;

    init() {
        self.f = OuterNestedOption{wrapped: null};
    }
}