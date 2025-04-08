struct PrimitiveGroup {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
}

contract PrimitiveGroupTest {
    state: PrimitiveGroup;

    init() {
        self.state = PrimitiveGroup{
            a: 33,
            b: true,
            c: myAddress(),
            d: "test",
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}