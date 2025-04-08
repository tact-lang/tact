struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Address;
    i: Int;
    j: Bool;
    k: Address?;
}

contract WideStorage {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: false,
            f: null,
            g: emptyCell(),
            h: myAddress(),
            i: 9,
            j: false,
            k: null,
        };
    }

    receive() {}
}