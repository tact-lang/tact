struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: String?;
    h: Bool?;
    i: Address?;
    j: Int?;
}

contract Test7 {
    data: Wide;

    init() {
        self.data = Wide{
            a:1, b:true, c:"abc", d: emptyCell(), e: myAddress(), f: emptyCell().asSlice(),
            g: null, h: null, i: null, j: null
        };
    }
}