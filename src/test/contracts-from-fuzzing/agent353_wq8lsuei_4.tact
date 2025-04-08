struct BigStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Address;
    g: Bool?;
    h: Int?;
    i: Cell?;
    j: String;
    k: Int;
    l: Slice;
    m: Address;
    n: Bool;
    o: String?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: "hello",
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: "world",
            k: 42,
            l: emptyCell().asSlice(),
            m: myAddress(),
            n: false,
            o: null,
        };
    }
}