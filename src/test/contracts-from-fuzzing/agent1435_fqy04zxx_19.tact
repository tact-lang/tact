struct OptionalInner {
    a: Int?;
    b: String?;
}

struct OptionalOuter {
    x: Int;
    y: OptionalInner?;
}

contract OptionalMix {
    info: OptionalOuter;

    init() {
        self.info = OptionalOuter{
            x: 100,
            y: null
        };
    }
}