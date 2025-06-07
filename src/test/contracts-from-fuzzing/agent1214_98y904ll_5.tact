struct BigFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Bool;
    h: Int;
    i: String;
}

contract Test5 {
    val: BigFields;
    init() {
        self.val = BigFields{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: false,
            h: -42,
            i: "bye",
        };
    }
}
