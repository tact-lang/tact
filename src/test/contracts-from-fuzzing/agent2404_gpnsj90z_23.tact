struct LastRemaining {
    id: Int;
    payload: Slice as remaining;
}

contract RemainingFieldContract {
    data: LastRemaining;

    init() {
        self.data = LastRemaining{
            id: 1,
            payload: beginCell().endCell().asSlice()
        };
    }
}