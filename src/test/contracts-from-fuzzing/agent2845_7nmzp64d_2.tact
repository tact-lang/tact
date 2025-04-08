struct InnerNested {
    a: Int;
    b: Bool;
    c: String;
}

struct OuterNested {
    x: Int;
    y: Bool;
    z: InnerNested;
}

contract NestedStructTest {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            x: 1,
            y: true,
            z: InnerNested{
                a: 42,
                b: false,
                c: "hi"
            }
        };
    }
}