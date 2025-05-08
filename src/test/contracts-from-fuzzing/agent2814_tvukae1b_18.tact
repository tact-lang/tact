struct RemainingStruct {
    x: Int;
    payload: Slice as remaining;
}

contract RemainingFieldContract {
    data: RemainingStruct;

    init() {
        self.data = RemainingStruct {
            x: 123,
            payload: emptyCell().asSlice()
        };
    }
}