struct DeepInner {
    xi: Int;
    yi: Int?;
}

struct MidLevel {
    p1: DeepInner;
    p2: DeepInner;
}

contract NestedStructContract {
    data: MidLevel;

    init() {
        self.data = MidLevel{
            p1: DeepInner{ xi: 1, yi: 2 },
            p2: DeepInner{ xi: 3, yi: null },
        };
    }
}