struct ValidRem {
    x: Int;
    rem: Slice as remaining;
}

contract Test37 {
    data: ValidRem;

    init() {
        self.data = ValidRem{
            x: 42,
            rem: emptyCell().asSlice(),
        };
    }
}