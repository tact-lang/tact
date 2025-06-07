struct RefsAndOpts {
    a: Address;
    b: Cell?;
    c: Slice?;
    d: Address?;
    e: Slice;
}

contract RefsContract {
    refField: RefsAndOpts;

    init() {
        self.refField = RefsAndOpts{
            a: myAddress(),
            b: null,
            c: emptyCell().asSlice(),
            d: null,
            e: emptyCell().asSlice()
        };
    }
}