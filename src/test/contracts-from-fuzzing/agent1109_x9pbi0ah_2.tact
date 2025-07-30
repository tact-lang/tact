struct ManyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
}

contract PrimitiveFieldsTest {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            i: 42,
            b: true,
            s: "test",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}