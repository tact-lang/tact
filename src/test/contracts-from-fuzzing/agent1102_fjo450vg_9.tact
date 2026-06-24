struct InnerStructA {
    foo: Int;
    bar: Int;
}

struct InnerStructB {
    baz: Bool;
    qux: String;
}

struct OuterStruct {
    a: InnerStructA;
    b: InnerStructB;
    optInner: InnerStructB?;
}

contract NestedCompound {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{
            a: InnerStructA{ foo: 1, bar: 2 },
            b: InnerStructB{ baz: true, qux: "hi" },
            optInner: null
        };
    }
}
