struct SerStruct {
    a: Int as uint4;
    b: Int as int8;
    c: Int as coins;
    d: Slice as remaining;
}

contract ContractWithSerStruct {
    data: SerStruct;

    init() {
        self.data = SerStruct{
            a: 5,
            b: -7,
            c: ton("0.1"),
            d: emptyCell().asSlice(),
        };
    }
}