struct OptionalInner {
    innerVal: Int;
}

struct OptionalOuter {
    optInner: OptionalInner?;
    outerVal: Int;
}

contract OptionalStructTest {
    testField: OptionalOuter;

    init() {
        self.testField = OptionalOuter{
            optInner: null,
            outerVal: 99,
        };
    }
}