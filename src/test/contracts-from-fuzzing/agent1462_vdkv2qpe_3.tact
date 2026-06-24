struct OptionalInner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    optField: OptionalInner?;

    init() {
        self.optField = OptionalInner{ foo: 1, bar: true };
    }
}