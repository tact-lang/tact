struct Small {
    x: Int;
}

struct Mid {
    inner: Small;
}

contract NestedOptionalStruct {
    optMid: Mid?;

    init() {
        self.optMid = Mid {
            inner: Small { x: 42 }
        };
    }
}