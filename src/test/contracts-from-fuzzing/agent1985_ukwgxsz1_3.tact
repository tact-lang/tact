struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int;
    h: Bool;
    i: String;
    j: Cell;
    k: Slice;
    l: Address;
}

contract WideFieldsTest {
    val: WideStruct;

    init() {
        self.val = WideStruct{
            a: 1,
            b: true,
            c: "c",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: 7,
            h: false,
            i: "i",
            j: emptyCell(),
            k: emptyCell().asSlice(),
            l: myAddress(),
        };
    }
}
