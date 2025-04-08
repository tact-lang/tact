struct OptionalInner {
    x: Int;
    text: String;
}

struct OptionalOuter {
    nested: OptionalInner?;
    flag: Bool;
}

contract OptionalStructTest {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            nested: null,
            flag: true,
        };
    }
}
