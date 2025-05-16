struct Inner {
    foo: Int;
    bar: Bool;
}

contract DefValues {
    sfield: Inner;

    init() {
        self.sfield = Inner{ foo: 42, bar: true };
    }
}