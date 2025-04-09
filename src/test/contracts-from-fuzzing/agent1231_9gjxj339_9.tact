struct NestedOpt {
    xx: Int?;
}

struct OuterOpt {
    nested: NestedOpt?;
}

contract OptionalNestedStructField {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{ nested: null };
    }
}