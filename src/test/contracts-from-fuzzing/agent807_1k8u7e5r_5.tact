struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract MixedFields {
    data: Mixed;
    init() {
        self.data = Mixed{
            i: 42,
            b: true,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}