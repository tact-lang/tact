struct OptionalInDepth {
    k: Int?;
}

struct MidOptional {
    m: OptionalInDepth?;
    n: Int;
}

contract OptDeepTest {
    optRec: MidOptional;

    init() {
        self.optRec = MidOptional{
            m: OptionalInDepth{ k: null },
            n: 5
        };
    }
}