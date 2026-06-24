struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
    k: Slice;
    l: Slice?;
}

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "abc",
            f: null,
            g: emptyCell(),
            h: null,
            i: myAddress(),
            j: null,
            k: emptyCell().asSlice(),
            l: null,
        };
    }
}