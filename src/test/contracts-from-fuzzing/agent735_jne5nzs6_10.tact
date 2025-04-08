struct NestedRem {
    id: Int;
    tail: Slice as remaining;
}

struct Container {
    prefix: Int as uint32;
    nested: NestedRem;
}

contract NestedRemainingContainer {
    data: Container;

    init() {
        self.data = Container{
            prefix: 0xdeadbeef,
            nested: NestedRem{
                id: 42,
                tail: emptyCell().asSlice(),
            },
        };
    }
}
