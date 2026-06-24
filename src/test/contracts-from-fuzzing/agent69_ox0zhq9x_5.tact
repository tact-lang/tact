struct NestedStruct {
    a: Int;
    b: InnerStruct;
}

struct InnerStruct {
    foo: Bool;
    bar: Int;
}

contract NestedFieldAccess {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            a: 7,
            b: InnerStruct{
                foo: true,
                bar: 42,
            },
        };
    }
}
