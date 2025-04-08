struct DeepNested {
    x: Int;
    y: Bool;
}

struct MiddleNested {
    d: DeepNested;
    z: String;
}

contract DeepNestTest {
    field: MiddleNested;

    init() {
        self.field = MiddleNested{
            d: DeepNested{
                x: 10,
                y: false,
            },
            z: "hi"
        };
    }
}