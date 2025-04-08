struct RemainWrap {
    prefix: Int as uint8;
    tail: Slice as remaining;
}

contract RemainingNested {
    wrapped: RemainWrap;

    init() {
        self.wrapped = RemainWrap{ prefix: 1, tail: emptyCell().asSlice() };
    }
}