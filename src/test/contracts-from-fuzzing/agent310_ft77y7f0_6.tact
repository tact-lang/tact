struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Slice;
    g: Cell;
}

contract TestContract {
    bf: BigStruct;
    bi: BigStruct?;

    init() {
        self.bf = BigStruct{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: "hello",
            f: emptyCell().asSlice(),
            g: emptyCell(),
        };
        self.bi = null;
    }
}
