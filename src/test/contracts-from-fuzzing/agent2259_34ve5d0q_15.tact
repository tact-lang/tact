struct NestedRem {
    some: Int;
    rest: Slice as remaining;
}

contract WithRemainingField {
    data: NestedRem;

    init() {
        self.data = NestedRem{
            some: 5,
            rest: emptyCell().asSlice()
        };
    }
}