struct DeepInner {
    a: Int;
    b: Bool;
}

struct DeepMiddle {
    inner: DeepInner;
    optInner: DeepInner?;
}

struct DeepOuter {
    middle: DeepMiddle;
    optMiddle: DeepMiddle?;
}

contract DeepNestTest {
    data: DeepOuter;

    init() {
        self.data = DeepOuter{
            middle: DeepMiddle{
                inner: DeepInner{
                    a: 1,
                    b: true
                },
                optInner: null
            },
            optMiddle: null
        };
    }
}