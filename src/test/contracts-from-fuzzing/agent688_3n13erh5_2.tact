struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    foo: FooStruct;
}

struct FooStruct {
    bar: BarStruct;
}

struct BarStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: InnerStruct{
                foo: FooStruct{
                    bar: BarStruct{
                        x: 1,
                        y: null,
                    }
                }
            }
        };
    }
}