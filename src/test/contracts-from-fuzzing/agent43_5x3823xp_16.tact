struct DeepInner {
    value: Int;
}

struct Middle {
    v1: DeepInner?;
    v2: DeepInner?;
}

struct Outer {
    mid: Middle?;
}

contract NestedOptionals {
    s: Outer;

    init() {
        self.s = Outer{
            mid: Middle{
                v1: null,
                v2: null
            }
        };
    }
}
