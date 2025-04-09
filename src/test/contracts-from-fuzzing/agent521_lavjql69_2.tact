struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int as uint32;
    f: Int as int64;
    g: Bool;
    h: String;
    i: Slice;
    j: Cell;
    k: Address;
}

contract LargeFieldsContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 42,
            f: -42,
            g: true,
            h: "hi",
            i: emptyCell().asSlice(),
            j: emptyCell(),
            k: myAddress(),
        };
    }
}