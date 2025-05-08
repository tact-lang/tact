struct WideStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
}

contract WideTest {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello",
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}
