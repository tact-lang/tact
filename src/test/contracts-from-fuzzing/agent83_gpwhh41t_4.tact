struct ManyPrimitives {
    a1: Int;
    a2: Bool;
    a3: Address;
    a4: Cell;
    a5: Slice;
    a6: Builder;
    a7: String;
}

contract PrimitiveVariety {
    data: ManyPrimitives;
    init() {
        self.data = ManyPrimitives{
            a1: 1,
            a2: false,
            a3: myAddress(),
            a4: emptyCell(),
            a5: emptyCell().asSlice(),
            a6: beginCell(),
            a7: "hello"
        };
    }
}
