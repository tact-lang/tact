struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: Address;
    g: Slice;
    h: Cell;
    i: String;
    j: Bool;
}

contract ManyFieldsStorage {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a: 1,
            b: true,
            c: "str",
            d: null,
            e: false,
            f: myAddress(),
            g: emptyCell().asSlice(),
            h: emptyCell(),
            i: "another",
            j: true,
        };
    }
}