struct BigStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "x",
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: null,
            k: emptyCell().asSlice(),
            l: null
        };
    }

    receive() {}
}