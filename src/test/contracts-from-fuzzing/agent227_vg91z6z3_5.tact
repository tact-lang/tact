struct Nested {
    a: Int;
    b: Bool;
    c: String?;
    d: Cell;
    e: Slice?;
}

contract WithStruct {
    data: Nested;

    init() {
        self.data = Nested{
            a: 1,
            b: false,
            c: null,
            d: emptyCell(),
            e: emptyCell().asSlice(),
        };
    }

    receive() {
        let _ = self.data.a;
    }
}
