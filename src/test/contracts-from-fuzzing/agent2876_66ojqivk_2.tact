struct InnerNested {
    u: Int;
    v: Bool?;
}

struct OuterNested {
    x: Int;
    y: InnerNested;
    z: Bool?;
}

contract NestStructTest {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            x: 12,
            y: InnerNested{u:34, v: null},
            z: true
        };
    }
}