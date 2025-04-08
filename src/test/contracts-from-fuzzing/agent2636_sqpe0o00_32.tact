struct NestedOptionalField {
    optInner: Inner?;
}

struct Inner {
    f: Int;
}

contract NestedOptionalFieldContract {
    data: NestedOptionalField;

    init() {
        self.data = NestedOptionalField{
            optInner: Inner{ f: 77 },
        };
    }
}