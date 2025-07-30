struct TailRemains {
    prefix: Int as uint32;
    suffix: Slice as remaining;
}

contract RemainingStorage {
    data: TailRemains;

    init() {
        self.data = TailRemains{
            prefix: 255,
            suffix: emptyCell().asSlice(),
        };
    }
}