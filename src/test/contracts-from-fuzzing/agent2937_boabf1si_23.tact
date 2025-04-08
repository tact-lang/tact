struct FirstOptionalThenRemaining {
    x: Int?;
    s: Slice as remaining;
}

contract TestOptionalThenRemaining {
    data: FirstOptionalThenRemaining;

    init() {
        self.data = FirstOptionalThenRemaining{
            x: null,
            s: emptyCell().asSlice()
        };
    }
}