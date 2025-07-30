struct DeepInner {
    b: Bool;
}

struct MidLevel {
    inner: DeepInner;
}

struct TopLevel {
    mid: MidLevel;
}

contract DeepNestedStructs {
    v: TopLevel;

    init() {
        self.v = TopLevel{ mid: MidLevel{ inner: DeepInner{ b: false } } };
    }
}