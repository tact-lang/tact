struct OptionalInner {
    x: Int;
}

struct OptionalOuter {
    a: OptionalInner?;
    b: Bool;
}

contract OptionalInnerStruct {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            a: OptionalInner { x: 10 },
            b: false,
        };
    }
}
