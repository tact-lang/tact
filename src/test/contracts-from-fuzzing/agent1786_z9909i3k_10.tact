struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;
    g: String;
}

contract TestPrimitives {
    state: ManyPrimitives;
    
    init() {
        self.state = ManyPrimitives {
            a: 1,
            b: false,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: "test",
        };
    }
}