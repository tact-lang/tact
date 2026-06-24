struct ManyTypes {
    x: Int;
    y: Int as uint32;
    flag: Bool;
    str: String;
    addr: Address;
    someSlice: Slice;
    someCell: Cell;
    builder: Builder;
    optInt: Int?;
    optStr: String?;
}

contract TestAllPrimitives {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            x: 42,
            y: 100,
            flag: true,
            str: "hello",
            addr: myAddress(),
            someSlice: emptyCell().asSlice(),
            someCell: emptyCell(),
            builder: beginCell(),
            optInt: null,
            optStr: null
        };
    }
}
