struct StructA {
    f1: Int;
    f2: String;
}

struct StructB {
    s1: StructA;
    s2: StructA;
}

struct StructC {
    nested: StructB;
    optNested: StructB?;
}

contract NestedWithOptionals {
    data: StructC;

    init() {
        self.data = StructC{
            nested: StructB{
                s1: StructA{f1: 1, f2: "one"},
                s2: StructA{f1: 2, f2: "two"}
            },
            optNested: null
        };
    }
}
