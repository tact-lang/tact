struct Small {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
}

contract VariousTypes {
    field: Small;

    init() {
        self.field = Small{
            a: 7,
            b: true,
            c: "text",
            d: emptyCell(),
            e: emptyCell().asSlice()
        };
    }
}