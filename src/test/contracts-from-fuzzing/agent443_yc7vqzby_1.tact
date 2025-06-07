struct InnerNested {
    a: Int;
    b: Bool;
}

struct OuterNested {
    x: InnerNested;
    y: Int;
}

contract NestedStructsTest {
    persistent: OuterNested;

    init() {
        self.persistent = OuterNested{
            x: InnerNested{
                a: 42,
                b: true
            },
            y: 999
        };
    }
}