struct InnerMost {
    x: Int;
}

struct MiddleLvl {
    inner: InnerMost;
}

struct OuterMost {
    middle: MiddleLvl;
}

contract MultiDeepNested {
    deep: OuterMost;

    init() {
        self.deep = OuterMost{
            middle: MiddleLvl{
                inner: InnerMost{
                    x: 999,
                },
            },
        };
    }
}