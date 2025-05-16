struct Remainder {
    known: Int;
    rest: Slice as remaining;
}

contract RemainderStruct {
    data: Remainder;

    init() {
        self.data = Remainder {
            known: 10,
            rest: emptyCell().asSlice(),
        };
    }
}