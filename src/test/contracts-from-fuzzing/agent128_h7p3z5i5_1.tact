struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract DeepNest {
    s: Nested;

    init() {
        self.s = Nested{ inner: InnerStruct{ val1: 1, val2: true } };
    }
}