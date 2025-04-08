struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    foo: FooStruct;
}

struct FooStruct {
    bar: Int;
    baz: String;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            inner: InnerStruct{
                foo: FooStruct{
                    bar: 1,
                    baz: "hi"
                }
            }
        };
    }
}