struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Address;
    k: Slice;
    l: Cell;
    m: String?;
}

contract BigStructContract {
    val: BigStruct;

    init() {
        self.val = BigStruct {
            a: 10,
            b: true,
            c: "c",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: false,
            i: "more",
            j: myAddress(),
            k: emptyCell().asSlice(),
            l: emptyCell(),
            m: null,
        };
    }
}