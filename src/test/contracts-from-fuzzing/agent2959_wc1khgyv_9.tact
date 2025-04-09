struct StructWithManyFieldTypes {
    num: Int;
    flag: Bool;
    optNum: Int?;
    text: String;
    cellVal: Cell;
    sliceVal: Slice;
    addr: Address;
}

contract VariousPersistentFields {
    data: StructWithManyFieldTypes;

    init() {
        self.data = StructWithManyFieldTypes{
            num: 7,
            flag: true,
            optNum: null,
            text: "hello",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}