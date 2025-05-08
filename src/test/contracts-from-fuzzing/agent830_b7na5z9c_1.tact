struct DeepInner {
    innerVal: Int;
}

struct DeepOuter {
    nested: DeepInner;
}

contract DeepNestedTest {
    s: DeepOuter;

    init() {
        self.s = DeepOuter{ nested: DeepInner{ innerVal: 42 } };
    }
}