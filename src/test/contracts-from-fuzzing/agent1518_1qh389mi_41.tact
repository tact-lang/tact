struct OptionalRem {
    header: Int as uint32;
    payload: Slice as remaining;
}

contract RemainOpt {
    val: OptionalRem;

    init() {
        self.val = OptionalRem{
            header: 55,
            payload: emptyCell().asSlice()
        };
    }
}