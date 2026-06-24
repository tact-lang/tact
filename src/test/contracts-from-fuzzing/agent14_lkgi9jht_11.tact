struct NestedStr {
    val: String;
    optval: String?;
}

struct Wrap {
    s1: NestedStr;
    s2: NestedStr?;
}

contract TestContract {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{
            s1: NestedStr{ val: "a", optval: null },
            s2: null,
        };
    }
}