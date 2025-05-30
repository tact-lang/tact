struct TestRec {
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

contract AllTypesTest {
    rec: TestRec;

    init() {
        self.rec = TestRec{
            a: 1,
            b: false,
            c: "X",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}