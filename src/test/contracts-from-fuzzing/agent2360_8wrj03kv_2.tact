struct ManyTypes {
    foo: Int;
    bar: Bool;
    addr: Address;
    cellData: Cell;
    sliceData: Slice;
    strData: String;
    coins: Int as coins;
    int8: Int as int8;
    uint64: Int as uint64;
    optionalInt: Int?;
    nested: NestedStruct;
}

struct NestedStruct {
    subfield: Bool;
}

contract Test {
    storage: ManyTypes;
    init() {
        self.storage = ManyTypes{
            foo: 1,
            bar: true,
            addr: myAddress(),
            cellData: emptyCell(),
            sliceData: emptyCell().asSlice(),
            strData: "hello",
            coins: 0,
            int8: 0,
            uint64: 0,
            optionalInt: null,
            nested: NestedStruct{subfield: false}
        };
    }
}