struct BigFields {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: String;
    f: Int?;
    g: Bool;
    h: String;
    i: Cell;
    j: Int;
}

contract BigFieldsTest {
    data: BigFields;

    init() {
        self.data = BigFields{
            a: 1, b: false, c: emptyCell().asSlice(), d: emptyCell(),
            e: "hello", f: null, g: true, h: "bye", i: emptyCell(), j:42
        };
    }
}
