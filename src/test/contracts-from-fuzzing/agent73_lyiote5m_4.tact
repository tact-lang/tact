struct OptionalInner {
    a: Int;
}

struct OptionalOuter {
    x: Int?;
    y: OptionalInner?;
}

contract Test {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{ x: null, y: null };
    }
}