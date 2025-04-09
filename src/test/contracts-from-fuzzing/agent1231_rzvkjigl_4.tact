struct BigOne {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: String;
    g: Cell;
    h: Slice;
}

contract TestContract {
    data: BigOne;

    init() {
        self.data = BigOne{
            a: 2,
            b: false,
            c: myAddress(),
            d: 3,
            e: true,
            f: "world",
            g: emptyCell(),
            h: emptyCell().asSlice(),
        };
    }
}
