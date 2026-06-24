struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Cell;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Slice?;
    k: Cell?;
    l: String?;
}

contract ManyFields {
    field: LargeStruct;

    init() {
        self.field = LargeStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: "hello",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}