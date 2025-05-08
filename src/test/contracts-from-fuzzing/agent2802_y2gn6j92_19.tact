struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address?;
    h: Cell;
    i: Slice;
    j: Slice?;
}

contract HasLargeStruct {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: null,
            f: null,
            g: null,
            h: beginCell().endCell(),
            i: beginCell().endCell().asSlice(),
            j: null
        };
    }
}