struct MultiType {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Builder;
}

contract Test {
    data: MultiType;

    init() {
        self.data = MultiType{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: emptyCell(),
            g: beginCell(),
        };
    }
}
