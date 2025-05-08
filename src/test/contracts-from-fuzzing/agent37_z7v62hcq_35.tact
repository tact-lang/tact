struct Mix {
    a: Int;
    b: Cell;
    c: String;
    d: Slice;
    e: Bool;
    f: Address;
}

contract Test {
    val: Mix;
    init() {
        self.val = Mix{
            a: 1,
            b: emptyCell(),
            c: "hi",
            d: emptyCell().asSlice(),
            e: true,
            f: myAddress(),
        };
    }
}