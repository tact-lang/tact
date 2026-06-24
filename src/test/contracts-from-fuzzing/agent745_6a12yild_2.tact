struct DeepNested {
    foo: Int;
}

struct MiddleNested {
    bar: DeepNested;
}

struct OuterStruct {
    baz: MiddleNested;
}

contract DeepNestedFields {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            baz: MiddleNested{
                bar: DeepNested{
                    foo: 1
                }
            }
        };
    }
}