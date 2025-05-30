struct DeepNested {
    n1: NestedInner;
}

struct NestedInner {
    n2: NestedInner2;
    optN2: NestedInner2?;
}

struct NestedInner2 {
    v1: Int;
    v2: Bool;
    v3: String;
}

contract Test {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{
            n1: NestedInner{
                n2: NestedInner2{
                    v1: 1,
                    v2: false,
                    v3: "x"
                },
                optN2: null
            }
        };
    }
}