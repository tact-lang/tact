struct ComplexData {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Address;
    f: Slice;
    g: Cell?;
    h: Bool;
    i: Int as uint32;
    j: String?;
    k: Address?;
    l: Cell;
    m: String;
}

contract BigStructContract {
    data: ComplexData;

    init() {
        self.data = ComplexData{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: emptyCell(),
            h: false,
            i: 42,
            j: "optional",
            k: null,
            l: emptyCell(),
            m: "end",
        };
    }
}