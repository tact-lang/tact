contract DeepNestedOptional {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{
                flag: true,
                number: 42,
                optNested: SomeStruct{
                    value: 7,
                    optInt: null
                }
            }
        };
    }
}

struct OuterStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    number: Int;
    optNested: SomeStruct?;
}

struct SomeStruct {
    value: Int;
    optInt: Int?;
}
