struct NestedStruct {
    a: Int;
    b: Bool;
    c: InnerStruct;
}

struct InnerStruct {
    d: Int as uint32;
    e: Bool?;
}

contract DeepNestedTest {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            a: 1,
            b: true,
            c: InnerStruct{
                d: 42,
                e: null,
            },
        };
    }
}