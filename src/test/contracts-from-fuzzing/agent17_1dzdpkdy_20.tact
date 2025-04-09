struct DataRemainder {
    count: Int as uint32;
    extra: Slice as remaining;
}

contract TestContract {
    dr: DataRemainder;

    init() {
        self.dr = DataRemainder{
            count: 5,
            extra: emptyCell().asSlice(),
        };
    }
}