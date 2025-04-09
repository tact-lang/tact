contract DeepNestedOptional {
    nested: OuterStruct;

    init() {
        self.nested = OuterStruct{
            inner: InnerStruct{
                flag: null,
                value: null
            },
            number: 1
        };
    }
}

struct OuterStruct {
    inner: InnerStruct;
    number: Int;
}

struct InnerStruct {
    flag: Bool?;
    value: Int?;
}
