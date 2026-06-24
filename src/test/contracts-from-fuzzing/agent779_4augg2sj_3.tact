struct DeepInner {
    val: Int?;
}

struct MidLevel {
    inner: DeepInner;
    flag: Bool;
}

contract DeepNestedTest {
    nested: MidLevel;

    init() {
        self.nested = MidLevel{
            inner: DeepInner{ val: null },
            flag: false
        };
    }
}