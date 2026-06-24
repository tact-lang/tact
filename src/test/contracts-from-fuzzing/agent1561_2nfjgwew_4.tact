struct OptionalInner {
    a: Int;
    b: Bool;
}

struct OptionalWrapper {
    maybeInner: OptionalInner?;
    flag: Bool;
}

contract OptionalStructTest {
    data: OptionalWrapper;

    init() {
        self.data = OptionalWrapper{
            maybeInner: null,
            flag: true
        };
    }
}