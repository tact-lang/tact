struct DeepNested {
    s1: String;
    s2: String;
}

struct MiddleNested {
    dn1: DeepNested;
    dn2: DeepNested;
}

struct OuterMost {
    mn: MiddleNested;
    val: Int;
}

contract DeepNestContract {
    storage: OuterMost;

    init() {
        self.storage = OuterMost{
            mn: MiddleNested{
                dn1: DeepNested{
                    s1: "a",
                    s2: "b"
                },
                dn2: DeepNested{
                    s1: "c",
                    s2: "d"
                }
            },
            val: 42
        };
    }
}