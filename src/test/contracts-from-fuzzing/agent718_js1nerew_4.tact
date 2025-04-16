struct NestedOptionalField {
    nested: Inner?;
}

struct Inner {
    value: Int;
    flag: Bool;
}

contract TestContract {
    data: NestedOptionalField;

    init() {
        self.data = NestedOptionalField{
            nested: null
        };
    }
}