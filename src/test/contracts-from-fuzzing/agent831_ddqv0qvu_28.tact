struct MultiType {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
}

contract Storage {
    data: MultiType;

    init() {
        self.data = MultiType{
            a: 123,
            b: false,
            c: "data",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress()
        };
    }
}