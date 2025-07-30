contract WidePrimitives {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: myAddress(),
            c: emptyCell(),
            d: "one",
            e: true,
            f: emptyCell().asSlice(),
            g: 2,
            h: myAddress(),
            i: emptyCell(),
            j: "two",
            k: false,
            l: emptyCell().asSlice(),
            m: 3,
            n: myAddress(),
            o: emptyCell()
        };
    }
}

struct BigStruct {
    a: Int;
    b: Address;
    c: Cell;
    d: String;
    e: Bool;
    f: Slice;
    g: Int;
    h: Address;
    i: Cell;
    j: String;
    k: Bool;
    l: Slice;
    m: Int;
    n: Address;
    o: Cell;
}
