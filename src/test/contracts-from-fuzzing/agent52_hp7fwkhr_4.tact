struct MultiType {
    a: Bool;
    b: Int;
    c: Cell;
    d: Address;
    e: Slice;
    f: String;
}

contract AllPrimitives {
    data: MultiType;

    init() {
        self.data = MultiType{
            a: true,
            b: 42,
            c: emptyCell(),
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: "test"
        };
    }
}
