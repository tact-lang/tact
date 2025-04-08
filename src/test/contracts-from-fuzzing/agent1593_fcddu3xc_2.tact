struct DeepNested {
    foo: Int;
    bar: Bool?;
}

struct MiddleNested {
    first: DeepNested;
    second: DeepNested;
}

struct OuterStruct {
    layer1: MiddleNested;
    layer2: MiddleNested;
}

contract TestContract {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{
            layer1: MiddleNested{
                first: DeepNested{ foo: 1, bar: null },
                second: DeepNested{ foo: 2, bar: null }
            },
            layer2: MiddleNested{
                first: DeepNested{ foo: 3, bar: null },
                second: DeepNested{ foo: 4, bar: null }
            }
        };
    }
}