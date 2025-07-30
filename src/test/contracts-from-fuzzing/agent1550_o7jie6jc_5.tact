struct DeepInner {
    val: Int;
}

struct MidLevel {
    inner: DeepInner;
}

struct TopLevel {
    middle: MidLevel;
}

contract DeepNestingContract {
    d: TopLevel;
    init() {
        self.d = TopLevel{
            middle: MidLevel{
                inner: DeepInner{
                    val: 777,
                },
            },
        };
    }
}