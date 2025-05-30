struct NestedStruct {
    a: Int;
    b: Bool?;
    c: InnerStruct;
}

struct InnerStruct {
    d: Int;
    e: Bool?;
}

contract TestContract {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            a: 1,
            b: true,
            c: InnerStruct{
                d: 2,
                e: false,
            },
        };
    }
}
