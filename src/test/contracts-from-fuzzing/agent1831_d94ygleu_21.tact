struct HasRem {
    start: Int;
    suffix: Slice as remaining;
}

contract TestContract {
    field: HasRem;

    init() {
        self.field = HasRem{
            start: 123,
            suffix: emptyCell().asSlice()
        };
    }
}