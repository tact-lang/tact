struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
}

contract WithLargeStruct {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "test",
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: null
        };
    }
}