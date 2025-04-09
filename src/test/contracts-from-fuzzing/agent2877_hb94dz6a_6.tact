struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract BigCombo {
    x: Int;
    y: BigNested;
    z: Bool;

    init() {
        self.x = 9;
        self.y = BigNested{
            a: 1,
            b: false,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
        };
        self.z = true;
    }
}