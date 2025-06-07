struct DeepNest {
    inner: InnerLevel;
}

struct InnerLevel {
    foo: FooStruct;
}

struct FooStruct {
    bar: BarStruct;
}

struct BarStruct {
    val: Int;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            inner: InnerLevel{
                foo: FooStruct{
                    bar: BarStruct{
                        val: 123,
                    },
                },
            },
        };
    }
}