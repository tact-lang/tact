struct OptionalInner {
    flag: Bool;
}

struct OptionalOuter {
    nested: OptionalInner?;
}

contract OptionalTest {
    info: OptionalOuter;

    init() {
        self.info = OptionalOuter{
            nested: null
        };
    }
}