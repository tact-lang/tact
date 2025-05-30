struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
}

contract MultiField {
    record: Mix;
    init() {
        self.record = Mix{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell().asSlice(),
            e: emptyCell()
        };
    }
}