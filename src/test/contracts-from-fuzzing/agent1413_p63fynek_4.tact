struct HugeData {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
    m: Int;
    n: Bool;
    o: String?;
}

contract BigContract {
    data: HugeData;

    init() {
        self.data = HugeData{
            a: 1,
            b: true,
            c: "test",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: 42,
            n: false,
            o: null,
        };
    }

    receive() {}
}
