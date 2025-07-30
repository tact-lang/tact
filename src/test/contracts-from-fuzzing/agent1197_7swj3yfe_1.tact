struct DeepNested {
    layer: InnerLayer;
}

struct InnerLayer {
    level: InnerMost;
}

struct InnerMost {
    x: Int;
    y: Bool;
    optZ: String?;
}

contract DeepNestTest {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            layer: InnerLayer{
                level: InnerMost{
                    x: 10,
                    y: false,
                    optZ: null,
                },
            },
        };
    }
}
