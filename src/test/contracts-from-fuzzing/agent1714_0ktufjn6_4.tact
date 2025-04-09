struct MultiPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract TestContract {
    store: MultiPrimitives;

    init() {
        self.store = MultiPrimitives{
            a: 99,
            b: false,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}