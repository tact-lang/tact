struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Slice?;
    j: Cell?;
}

contract DeepStorage {
    state: Deep;
    
    init() {
        self.state = Deep{
            a: 1,
            b: false,
            c: "test",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: 2,
            g: true,
            h: null,
            i: null,
            j: null
        };
    }
}
