struct NestedStruct {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int;
    d: InnerMost;
}

struct InnerMost {
    e: Bool;
    f: String;
    g: Int?;
}

contract Test {
    store: NestedStruct;
    init() {
        self.store = NestedStruct{
            a: 1,
            b: Inner{
                c: 2,
                d: InnerMost{
                    e: true,
                    f: "hi",
                    g: null,
                }
            }
        };
    }
}