struct Various {
    x: Int;
    b: Bool;
    s: String;
    sl: Slice;
    c: Cell;
    addr: Address;
}

contract MixedPrimitives {
    storage: Various;

    init() {
        self.storage = Various{
            x: 1,
            b: true,
            s: "test",
            sl: emptyCell().asSlice(),
            c: emptyCell(),
            addr: myAddress()
        };
    }
}