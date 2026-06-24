struct DeepNested {
    inner1: Int;
    inner2: Bool;
}

struct MiddleNested {
    mid1: DeepNested;
    mid2: String;
}

contract DeepStructTest {
    field: MiddleNested;

    init() {
        self.field = MiddleNested{
            mid1: DeepNested{
                inner1: 10,
                inner2: false,
            },
            mid2: "hello",
        };
    }
}