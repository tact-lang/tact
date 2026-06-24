struct RecA {
    foo: Int;
    bar: Bool;
}

contract StructReinitialize {
    s: RecA;

    init() {
        self.s = RecA{ foo: 12, bar: true };
    }

    receive() {
        self.s = RecA{ foo: 42, bar: false };
    }
}
