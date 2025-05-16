struct NullableInner {
    x: Int?;
}

struct NullableOuter {
    inner: NullableInner?;
}

contract DoubleOpt {
    field: NullableOuter;
    init() {
        self.field = NullableOuter{ inner: NullableInner{ x: null } };
    }
}