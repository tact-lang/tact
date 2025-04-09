struct DeepInner {
    innermost: Int;
}

struct Middle {
    val1: Int;
    optInner: DeepInner?;
}

struct Outer {
    valOuter: Int;
    nested: Middle;
    optNested: Middle?;
}

contract TestContract {
    state: Outer;
    init() {
        self.state = Outer{
            valOuter: 1,
            nested: Middle{
                val1: 2,
                optInner: null,
            },
            optNested: null,
        };
    }
}