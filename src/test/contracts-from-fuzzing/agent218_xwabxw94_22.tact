struct InnerRemainder {
    important: Int;
    tail: Slice as remaining;
}

struct WrapperRem {
    flag: Bool;
    chunk: InnerRemainder;
}

contract NestedRemaining {
    wrap: WrapperRem;

    init() {
        self.wrap = WrapperRem{
            flag: true,
            chunk: InnerRemainder{
                important: 123,
                tail: emptyCell().asSlice()
            }
        };
    }
}