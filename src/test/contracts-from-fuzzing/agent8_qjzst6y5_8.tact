struct InnerNested {
    x: Int;
}

struct MiddleNested {
    s: InnerNested;
}

struct OuterNested {
    m: MiddleNested;
}

contract OptionalDeepNested {
    deep: OuterNested?;

    init() {
        self.deep = null;
    }
}