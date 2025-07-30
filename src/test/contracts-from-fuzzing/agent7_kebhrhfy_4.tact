struct OptionalInner {
    val: Int;
}

struct OptionalContainer {
    x: OptionalInner?;
    y: Bool;
}

contract OptionalNesting {
    data: OptionalContainer;

    init() {
        self.data = OptionalContainer{
            x: null,
            y: true
        };
    }
}