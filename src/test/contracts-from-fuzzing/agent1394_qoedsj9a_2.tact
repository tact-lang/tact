struct DeepInner {
    d: Int;
}

struct MidInner {
    m: DeepInner;
}

struct Outer {
    o: MidInner;
}

contract DeepNestedStructVar {
    s: Outer;
    init() {
        self.s = Outer{ o: MidInner{ m: DeepInner{ d: 99 } } };
    }
}
