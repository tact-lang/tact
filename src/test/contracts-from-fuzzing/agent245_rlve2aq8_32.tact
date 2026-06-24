struct Combo {
    i: Int;
    b: Bool;
    s: Slice;
    c: Cell;
    str: String;
}

contract ComboFieldsTest {
    d: Combo;

    init() {
        self.d = Combo{
            i: 5,
            b: true,
            s: emptyCell().asSlice(),
            c: emptyCell(),
            str: "abc"
        };
    }
}