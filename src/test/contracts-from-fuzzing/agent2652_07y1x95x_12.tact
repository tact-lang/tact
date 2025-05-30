struct HasRemaining {
    a: Int;
    data: Slice as remaining;
}

contract RemainingFieldTest {
    payload: HasRemaining;

    init() {
        self.payload = HasRemaining{
            a: 99,
            data: emptyCell().asSlice()
        };
    }
}