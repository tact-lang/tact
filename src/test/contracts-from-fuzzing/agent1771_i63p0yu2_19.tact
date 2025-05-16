struct Suffixed {
    count: Int;
    payload: Slice as remaining;
}

contract RemainingFieldPersist {
    data: Suffixed;

    init() {
        self.data = Suffixed{
            count: 2,
            payload: emptyCell().asSlice(),
        };
    }
}