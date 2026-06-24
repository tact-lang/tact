struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
    j: Cell?;
    k: Slice?;
    l: Address?;
    m: Int;
    n: Bool;
    o: String;
    p: Int?;
}

contract LargeFieldsContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 0, b: false, c: "", d: null, e: null, f: null,
            g: emptyCell(), h: emptyCell().asSlice(), i: myAddress(),
            j: null, k: null, l: null,
            m: -100, n: true, o: "abc", p: null
        };
    }
}
