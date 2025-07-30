struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
    f: Cell;
    g: Slice;
    h: String;
    i: Int;
    j: Bool;
    k: String;
    l: Int?;
    m: Bool;
}

contract TestContract {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a: 1,
            b: false,
            c: null,
            d: "hello",
            e: null,
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: "world",
            i: 2,
            j: true,
            k: "!",
            l: null,
            m: true
        };
    }
}