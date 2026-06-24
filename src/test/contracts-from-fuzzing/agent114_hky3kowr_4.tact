struct OptionalInner {
    intField: Int;
}

struct OptionalOuter {
    optInner: OptionalInner?;
    flag: Bool;
}

contract OptionalNestedContract {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            optInner: null,
            flag: true,
        };
    }
}