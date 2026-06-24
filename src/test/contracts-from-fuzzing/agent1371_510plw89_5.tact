struct Inner {
    x: Int?;
    y: Bool?;
    note: String;
}

struct Combo {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
    g: Inner?;   
}

contract OptMix {
    data: Combo;

    init() {
        self.data = Combo{
            a: null,
            b: true,
            c: null,
            d: null,
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: Inner{
                x: null,
                y: null,
                note: "Hello"
            }
        };
    }
}
