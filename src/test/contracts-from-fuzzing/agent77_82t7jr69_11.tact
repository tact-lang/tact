struct BigStruct {
    a: Int;
    b: Bool;
    c: String?;
    d: Address;
    e: Bool?;
    f: Int?;
    g: String;
    h: Cell;
    i: Slice;
    j: Address?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: null,
            d: myAddress(),
            e: null,
            f: null,
            g: "test",
            h: emptyCell(),
            i: emptyCell().asSlice(),
            j: null
        };
    }
}