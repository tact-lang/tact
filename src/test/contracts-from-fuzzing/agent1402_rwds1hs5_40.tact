struct HasRem {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract RemainingSlice {
    data: HasRem;

    init() {
        self.data = HasRem{ prefix: 42, suffix: emptyCell().asSlice() };
    }
}