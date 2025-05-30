struct BigOne {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: String;
    f: Address;
    g: Bool?;
    h: Int?;
}

contract T {
    data: BigOne;
    init() {
        self.data = BigOne{
            a: 1,
            b: true,
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: "hi",
            f: myAddress(),
            g: null,
            h: null,
        };
    }
}