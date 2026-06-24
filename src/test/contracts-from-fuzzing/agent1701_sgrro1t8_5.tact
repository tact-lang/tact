struct MixedTypes {
    i: Int;
    b: Bool;
    addr: Address;
    cellData: Cell;
    sliceData: Slice;
    str: String;
}

contract MixedContract {
    m: MixedTypes;

    init() {
        self.m = MixedTypes{
            i: 10,
            b: true,
            addr: myAddress(),
            cellData: emptyCell(),
            sliceData: emptyCell().asSlice(),
            str: "abc"
        };
    }
}