struct NestedOptional {
    innerOptInt: Int?;
}

struct OuterOptional {
    nestedOpt: NestedOptional?;
}

contract OptionalInOptional {
    field: OuterOptional;

    init() {
        self.field = OuterOptional{ nestedOpt: null };
    }
}