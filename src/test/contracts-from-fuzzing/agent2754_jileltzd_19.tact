struct Varied {
    n: Int;
    flag: Bool;
    text: String?;
    addr: Address;
    cellPart: Cell;
    slicePart: Slice;
}

contract MixedTypes {
    info: Varied;

    init() {
        self.info = Varied{
            n: 7,
            flag: true,
            text: null,
            addr: myAddress(),
            cellPart: emptyCell(),
            slicePart: emptyCell().asSlice()
        };
    }
}
