struct OptionalNested {
    opt1: Int?;
    opt2: SInner?;
}

struct SInner {
    x: Int;
    y: Bool;
}

contract OptionalNesting {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            opt1: null,
            opt2: SInner{ x: 5, y: true }
        };
    }
}