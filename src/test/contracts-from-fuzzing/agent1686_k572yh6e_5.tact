struct OptionalStuff {
    foo: Int?;
    bar: Bool?;
    txt: String?;
    addr: Address?;
    cellData: Cell?;
    sliceData: Slice?;
}

contract OptionalFields {
    data: OptionalStuff;

    init() {
        self.data = OptionalStuff{
            foo: null,
            bar: true,
            txt: null,
            addr: myAddress(),
            cellData: emptyCell(),
            sliceData: emptyCell().asSlice()
        };
    }
}