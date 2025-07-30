struct WideStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: String;
    h: Address;
    i: Bool;
    j: Int;
    k: Int;
    l: Bool;
    m: Cell;
    n: Slice;
    o: String;
}

contract WideContract {
    s: WideStruct;

    init() {
        self.s = WideStruct{
            a: 1, b: true, c: myAddress(), d: emptyCell(), e: emptyCell().asSlice(),
            f: "x", g: "y", h: myAddress(), i: false, j: 2, k: 3, l: true,
            m: emptyCell(), n: emptyCell().asSlice(), o: "z"
        };
    }
}