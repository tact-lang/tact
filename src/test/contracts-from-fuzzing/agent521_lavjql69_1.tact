struct NestedOptionalStruct {
    a: Int?;
    b: Bool?;
    c: InnerStruct?;
}

struct InnerStruct {
    d: Int;
    e: Bool;
}

contract TestContract {
    s: NestedOptionalStruct;

    init() {
        self.s = NestedOptionalStruct{
            a: null,
            b: true,
            c: InnerStruct{ d: 1, e: false },
        };
    }
}