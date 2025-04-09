struct OptionalNested2 {
    foo: Int?;
}

struct OuterStruct {
    bar: OptionalNested2?;
}

contract NullableNestedField {
    store: OuterStruct;

    init() {
        self.store = OuterStruct{
            bar: null
        };
    }
}