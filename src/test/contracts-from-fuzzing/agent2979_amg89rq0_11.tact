struct Inner { foo: Int; bar: Bool; }

contract OptionalInner {
    optStruct: Inner?;

    init() {
        self.optStruct = Inner{ foo: 1, bar: false };
    }
}