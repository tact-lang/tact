struct DeepNested {
    level: Int;
    optInner: Inner?;
}

struct Inner {
    x: Int;
}

contract DeepOptionalTest {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            level: 3,
            optInner: Inner{ x: 9 },
        };
    }
}