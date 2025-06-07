struct OptionalInDeepNested {
    outerInt: Int;
    maybeMid: Mid?;
}

struct Mid {
    innerBool: Bool;
    maybeInner: Inner?;
}

struct Inner {
    value: Int;
}

contract OptionalDeepNested {
    data: OptionalInDeepNested;

    init() {
        self.data = OptionalInDeepNested{
            outerInt: 42,
            maybeMid: Mid{
                innerBool: true,
                maybeInner: Inner{value: 99}
            }
        };
    }
}