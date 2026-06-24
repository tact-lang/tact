struct LongStruct {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Cell;
    f: Cell?;
    g: Bool;
    h: Bool?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;
    m: Int;
}

contract Test {
    big: LongStruct;
    init() {
        self.big = LongStruct{
            a: 1, b: null, c: "hi", d: null, e: emptyCell(), f: null,
            g: true, h: null, i: emptyCell().asSlice(), j: null, k: myAddress(), l: null, m: 42
        };
    }
}