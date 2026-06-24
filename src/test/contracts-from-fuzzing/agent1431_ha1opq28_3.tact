struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String;
    k: Address;
    l: Cell;
    m: Slice;
    n: Builder;
}

contract TestContract {
    wide: WideStruct;

    init() {
        self.wide = WideStruct{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: false,
            j: "world",
            k: myAddress(),
            l: emptyCell(),
            m: emptyCell().asSlice(),
            n: beginCell()
        };
    }
}