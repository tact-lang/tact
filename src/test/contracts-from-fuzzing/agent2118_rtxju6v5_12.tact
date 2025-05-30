struct NestedRemain {
    prefix: Int as uint8;
    nested: Inner;
}

struct Inner {
    stuff: Int;
    suffix: Slice as remaining;
}

contract DeepRemTest {
    all: NestedRemain;

    init() {
        self.all = NestedRemain{
            prefix: 1,
            nested: Inner{
                stuff: 42,
                suffix: emptyCell().asSlice(),
            },
        };
    }
}