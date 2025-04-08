struct InnerLevel {
    value: Int;
}

struct MiddleLevel {
    inner: InnerLevel;
    optInner: InnerLevel?;
}

struct OuterLevel {
    middle: MiddleLevel;
    optMiddle: MiddleLevel?;
}

contract NestedStructTest {
    storageField: OuterLevel;

    init() {
        self.storageField = OuterLevel {
            middle: MiddleLevel {
                inner: InnerLevel { value: 5 },
                optInner: null,
            },
            optMiddle: null,
        };
    }
}