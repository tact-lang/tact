struct Huge {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Cell;
    f: Slice;
    g: Address;
}

contract TestHuge {
    val: Huge;
    init() {
        self.val = Huge{
            a: 1,
            b: false,
            c: null,
            d: "hello",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: myAddress(),
        };
    }
}