struct MultipleRemaining {
    first: Int as uint8;
    rest1: Slice as remaining;
}

struct Wrapper {
    m: MultipleRemaining;
    rest2: Slice as remaining;
}

contract TestRemInNested {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            m: MultipleRemaining{
                first:1,
                rest1: emptyCell().asSlice()
            },
            rest2: emptyCell().asSlice()
        };
    }
}
