// wide struct with many distinct primitive fields
struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract TestContract {
    w: Wide;
    init() {
        self.w = Wide {
            a: 1,
            b: false,
            c: "wide",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: null
        };
    }
}