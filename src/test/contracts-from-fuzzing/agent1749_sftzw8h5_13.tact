struct HasRemaining {
    foo: Int;
    bar: Slice as remaining;
}

contract RemainingFieldTest {
    field: HasRemaining;
    init() {
        self.field = HasRemaining{
            foo: 1,
            bar: emptyCell().asSlice(),
        };
    }
}