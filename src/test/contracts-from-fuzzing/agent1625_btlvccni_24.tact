struct DeepInner {
    veryDeep: Bool?;
}

struct MiddleInner {
    deep: DeepInner;
}

struct OuterStruct {
    middle: MiddleInner?;
}

contract OptDeepNested {
    saved: OuterStruct;

    init() {
        self.saved = OuterStruct { middle: null };
    }
}
