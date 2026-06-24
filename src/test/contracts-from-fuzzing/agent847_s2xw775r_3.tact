struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int;
    h: Bool;
    i: String;
    j: Address;
}

contract LargeStructStorage {
    field: LargeStruct;

    init() {
        self.field = LargeStruct{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: 7,
            h: false,
            i: "xyz",
            j: myAddress()
        };
    }
}