struct RemainingData {
    prefix: Int as uint8;
    suffix: Slice as remaining;
}

contract RemainContract {
    data: RemainingData;

    init() {
        self.data = RemainingData {
            prefix: 10,
            suffix: emptyCell().asSlice()
        };
    }
}