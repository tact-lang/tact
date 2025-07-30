struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: Cell;
    g: Slice;
    h: String;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
    m: Int;
    n: Bool;
}

contract LargeStructFieldContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 77,
            b: false,
            c: null,
            d: null,
            e: myAddress(),
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: "hello",
            i: "world",
            j: null,
            k: null,
            l: null,
            m: 88,
            n: true
        };
    }
}