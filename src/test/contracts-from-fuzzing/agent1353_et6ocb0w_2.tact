struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract TestContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: null,
            h: null,
            i: null,
        };
    }
}