struct MultiType {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
}

contract TestContract {
    record: MultiType;

    init() {
        self.record = MultiType{
            a: 123,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice()
        };
    }
}