struct NestedVal {
    foo: Int;
    bar: Bool;
}

contract InInitOnly {
    n: NestedVal;
    x: Int as uint8;

    init() {
        self.x = 77;
        self.n = NestedVal{
            foo: 123,
            bar: true,
        };
    }
}