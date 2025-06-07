struct BigStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
    k: Cell?;
    l: Slice?;
}

contract BigStorage {
    storage: BigStruct;

    init() {
        self.storage = BigStruct{
            a: 1, b: true, c: myAddress(), d: "big",
            e: emptyCell(), f: emptyCell().asSlice(),
            g: 2, h: false, i: null, j: null, k: null, l: null
        };
    }
}
