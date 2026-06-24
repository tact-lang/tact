struct NestedOptional {
    foo: Int?;
    bar: String?;
}

struct InnerStruct {
    nested: NestedOptional;
    val: Int;
}

contract DeeplyNested {
    inner: InnerStruct;
    count: Int = 0;

    init() {
        self.count = 1;
        self.inner = InnerStruct{
            nested: NestedOptional{
                foo: 10,
                bar: "hello"
            },
            val: 5
        };
    }
}