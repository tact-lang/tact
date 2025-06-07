struct NestedOptionalStruct {
    nested: Nested?;
}

struct Nested {
    value: Int?;
}

contract TestContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct {
            nested: Nested {
                value: null,
            }
        };
    }
}