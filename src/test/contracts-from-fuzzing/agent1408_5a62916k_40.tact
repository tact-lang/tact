struct OptAndRem {
    a: Int?;
    rem: Slice as remaining;
}

contract TestContract {
    data: OptAndRem;

    init() {
        self.data = OptAndRem{
            a: null,
            rem: emptyCell().asSlice(),
        };
    }
}