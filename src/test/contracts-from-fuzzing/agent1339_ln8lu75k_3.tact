struct InnerStruct {
    x: Int;
    y: Int;
}

struct OuterStruct {
    inner: InnerStruct;
    z: Int;
}

contract DeepNestedStruct {
    nested: OuterStruct;

    init() {
        self.nested = OuterStruct{
            inner: InnerStruct{ x: 1, y: 2 },
            z: 3
        };
    }
}