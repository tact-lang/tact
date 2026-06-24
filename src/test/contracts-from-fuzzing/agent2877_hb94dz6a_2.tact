struct Nested {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            i: 42,
            b: false,
            s: "nested",
            c: emptyCell(),
        };
    }
}