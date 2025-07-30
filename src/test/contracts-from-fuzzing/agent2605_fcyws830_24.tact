struct FinalBigStruct {
    intVal: Int;
    sVal: String;
    boolVal: Bool;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    nested: Nested;
}

struct Nested {
    x: Int;
    y: Int;
    flag: Bool;
    text: String;
}

contract UltimateTest {
    payload: FinalBigStruct;

    init() {
        let c = emptyCell();
        self.payload = FinalBigStruct{
            intVal: 7,
            sVal: "hi",
            boolVal: true,
            addr: myAddress(),
            cellVal: c,
            sliceVal: c.asSlice(),
            optInt: null,
            optStr: null,
            optBool: null,
            optAddr: null,
            optCell: null,
            optSlice: null,
            nested: Nested{
                x: 1,
                y: 2,
                flag: false,
                text: "nested",
            },
        };
    }
}
