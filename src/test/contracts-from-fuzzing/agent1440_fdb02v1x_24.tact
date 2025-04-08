struct BigFlat {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Slice;
    k: Cell?;
    l: Slice?;
}

contract FlatStructTest {
    data: BigFlat;

    init() {
        self.data = BigFlat{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: false,
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: emptyCell().asSlice(),
            k: null,
            l: null
        };
    }
}