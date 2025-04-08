struct NestedOptionalStruct {
    foo: Int?;
    bar: Bool?;
    buzz: String?;
    baz: InnerStruct?;
}

struct InnerStruct {
    i: Int;
    s: String;
}

contract TestContract {
    field: NestedOptionalStruct;
    
    init() {
        self.field = NestedOptionalStruct{
            foo: 1,
            bar: true,
            buzz: "x",
            baz: InnerStruct { i: 2, s: "y" },
        };
    }
}
