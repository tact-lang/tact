struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Bool?;
    h: Int?;
    i: String;
    j: Slice;
}

contract ComplexStorage {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: null,
            h: 2,
            i: "def",
            j: emptyCell().asSlice(),
        };
    }
}