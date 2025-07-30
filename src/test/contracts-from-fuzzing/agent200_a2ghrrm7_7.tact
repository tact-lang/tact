struct MultiNestedOptionals {
    inner: InnerStruct?;
}

struct InnerStruct {
    value: Int?;
}

contract NestedOptionalStructs {
    foo: MultiNestedOptionals;

    init() {
        self.foo = MultiNestedOptionals{
            inner: InnerStruct{
                value: null,
            },
        };
    }
}