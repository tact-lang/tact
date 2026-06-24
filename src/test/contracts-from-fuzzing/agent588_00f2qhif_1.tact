struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Address;
    k: Int;
    l: Bool;
    m: String;
}

contract TestContract {
    data: LargeStruct;
    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: false,
            i: "x",
            j: myAddress(),
            k: 42,
            l: true,
            m: "y",
        };
    }
}