struct MultiPrimitive {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract MultiFieldTest {
    m: MultiPrimitive;

    init() {
        self.m = MultiPrimitive{
            a: 42,
            b: false,
            c: "x",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}