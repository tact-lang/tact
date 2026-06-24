struct RemainingTail {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract RemainingStructContract {
    data: RemainingTail;

    init() {
        self.data = RemainingTail{ prefix: 7, suffix: emptyCell().asSlice() };
    }
}