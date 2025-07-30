struct Complex {
    flag: Bool;
    number: Int;
    addr: Address;
    cellData: Cell;
    sliceData: Slice;
    text: String;
}

contract DiverseFields {
    data: Complex;

    init() {
        self.data = Complex{
            flag: true,
            number: 123,
            addr: myAddress(),
            cellData: emptyCell(),
            sliceData: emptyCell().asSlice(),
            text: "test"
        };
    }
}