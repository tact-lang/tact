struct TinyDeep {
    i1: Int;
    s1: NestedStr;
}

struct NestedStr {
    str: String;
}

contract TinyDeepContract {
    d: TinyDeep;

    init() {
        self.d = TinyDeep{ i1: 1, s1: NestedStr{ str: "Z" } };
    }
}