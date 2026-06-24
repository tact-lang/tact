struct OptionalDeepNest {
    s1: OptionalInner?;
}

struct OptionalInner {
    s2: OptionalLeaf?;
}

struct OptionalLeaf {
    val: Int;
}

contract OptDeepNest {
    data: OptionalDeepNest;

    init() {
        self.data = OptionalDeepNest{
            s1: OptionalInner{
                s2: null,
            },
        };
    }
}