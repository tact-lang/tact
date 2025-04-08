struct MultiPrimitive {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Cell;
}

contract TestContract {
    data: MultiPrimitive;

    init() {
        self.data = MultiPrimitive{
            a: 11,
            b: false,
            c: myAddress(),
            d: emptyCell().asSlice(),
            e: emptyCell(),
        };
    }
}