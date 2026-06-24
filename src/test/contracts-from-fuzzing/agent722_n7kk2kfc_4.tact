struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Builder;
}

contract Combo {
    val: Mix;

    init() {
        self.val = Mix{
            a: 42,
            b: false,
            c: "hello",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}