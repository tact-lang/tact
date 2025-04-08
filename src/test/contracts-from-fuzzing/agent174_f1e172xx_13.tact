struct NullableNested {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract TestContract {
    nestedOpt: NullableNested;

    init() {
        self.nestedOpt = NullableNested{ inner: Inner{ value: null } };
    }
}