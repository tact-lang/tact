struct InnerNested {
    a: Int;
    b: Bool;
}

struct OuterNested {
    x: Int;
    y: InnerNested;
    z: Bool?;
}

contract NestedTest {
    compound: OuterNested;

    init() {
        self.compound = OuterNested{
            x: 1,
            y: InnerNested{ a: 2, b: true },
            z: false,
        };
    }
}