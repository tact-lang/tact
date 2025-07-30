struct Inner {
    small: Int as uint8;
    signed: Int as int16;
}

struct Outer {
    mainVal: Int as uint32;
    nested: Inner;
}

contract TestContract {
    record: Outer;

    init() {
        self.record = Outer{
            mainVal: 7,
            nested: Inner{
                small: 3,
                signed: -5,
            },
        };
    }
}