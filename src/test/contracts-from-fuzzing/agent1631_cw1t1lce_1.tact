struct NestedValues {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
}

contract TestStorage {
    values: NestedValues;

    init() {
        self.values = NestedValues{
            a: 1,
            b: true,
            c: "test",
            d: emptyCell(),
            e: emptyCell().asSlice(),
        };
    }
}