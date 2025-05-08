struct VariedTypes {
    intval: Int;
    flag: Bool;
    addr: Address;
    cellval: Cell;
    sliceval: Slice;
    strval: String;
}

contract MixedTypes {
    data: VariedTypes;

    init() {
        self.data = VariedTypes{
            intval: 1,
            flag: true,
            addr: myAddress(),
            cellval: emptyCell(),
            sliceval: emptyCell().asSlice(),
            strval: "hello"
        };
    }
}