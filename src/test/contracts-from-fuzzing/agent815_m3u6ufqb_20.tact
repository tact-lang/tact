struct DeepInner {
    a: Int;
}

struct MidInner {
    d: DeepInner;
    s: String?;
}

struct OuterMost {
    m: MidInner;
    b: Bool;
}

contract ComplexNestedOpt {
    val: OuterMost;

    init() {
        self.val = OuterMost{
            m: MidInner{
                d: DeepInner{ a: 999 },
                s: null
            },
            b: true
        };
    }
}