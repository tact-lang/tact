struct NestedOptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct Wrapper {
    nested: NestedOptStruct;
    other: Int;
}

contract OptStructField {
    field: Wrapper;
    init() {
        self.field = Wrapper{
            nested: NestedOptStruct{ foo: null, bar: null, baz: null },
            other: 5,
        };
    }
}