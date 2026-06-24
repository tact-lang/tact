struct WideStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Slice;
    f: Cell;
    g: Builder;
    h: String?;
    i: Int?;
    j: Bool?;
}

contract WideStructContract {
    s: WideStruct;

    init() {
        self.s = WideStruct{
            a: 99,
            b: false,
            c: myAddress(),
            d: "hello",
            e: emptyCell().asSlice(),
            f: emptyCell(),
            g: beginCell(),
            h: null,
            i: null,
            j: true
        };
    }
}