struct Inner {
    foo: Int as uint8;
    bar: Int as uint4;
}

struct Outer {
    nested: Inner;
    big: Int;
}

contract TestContract {
    record: Outer;

    init() {
        self.record = Outer {
            nested: Inner { foo: 12, bar: 7 },
            big: 123456789
        };
    }
}