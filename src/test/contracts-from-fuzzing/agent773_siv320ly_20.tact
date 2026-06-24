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
    j: Address?;
}

contract Monster {
    store: BigStruct;

    init() {
        self.store = BigStruct{
            a: 1, b: true, c: "s", d: emptyCell(),
            e: emptyCell().asSlice(), f: myAddress(),
            g: null, h: null, i: null, j: null
        };
    }
}