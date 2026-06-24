struct MultiType {
    n: Int;
    flag: Bool;
    addr: Address;
    cellData: Cell;
    dataSlice: Slice;
    aString: String;
}

contract StructMultiType {
    s: MultiType;
    init() {
        self.s = MultiType{
            n: 123,
            flag: true,
            addr: myAddress(),
            cellData: emptyCell(),
            dataSlice: emptyCell().asSlice(),
            aString: "hello",
        };
    }
}