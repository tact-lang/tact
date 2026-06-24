struct DeepNested {
    sub: NestedStruct;
    num: Int;
}

struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{
            sub: NestedStruct{
                a: 1,
                b: false,
                c: "deep"
            },
            num: 42
        };
    }
}