struct RemainSlice {
    data: Slice as remaining;
}

contract RemainingFieldContract {
    field: RemainSlice;

    init() {
        self.field = RemainSlice{
            data: emptyCell().asSlice()
        };
    }
}