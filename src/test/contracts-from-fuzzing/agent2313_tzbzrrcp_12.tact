struct NestedMix {
    a: Int;
    b: Bool;
    c: String;
    optNested: InnerNested?;
}

struct InnerNested {
    d: Int;
    e: String;
    f: Bool?;
}

contract TestContract {
    data: NestedMix;

    init() {
        self.data = NestedMix{
            a: 1,
            b: false,
            c: "abc",
            optNested: null
        };
    }
}