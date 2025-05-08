struct NullableDeep {
    data: NestedOpt?;
}

struct NestedOpt {
    value: Int?;
}

contract NullableInside {
    s: NullableDeep;

    init() {
        self.s = NullableDeep{ data: null };
    }
}