struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;
}

contract TestContract {
    bigfield: BigStruct;

    init() {
        self.bigfield = BigStruct{
            a: 1,
            b: true,
            c: "str",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: 7,
            h: false,
            i: "opt",
            j: emptyCell(),
            k: emptyCell().asSlice(),
            l: myAddress(),
        };
    }
}
