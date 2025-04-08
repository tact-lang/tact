struct ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: String;
    g: String;
    h: Cell;
    i: Address;
    j: Slice;
    k: Bool;
    l: Int;
}

contract ManyFieldsContract {
    field: ManyFields;

    init() {
        self.field = ManyFields{
            a: 1, b: 2, c: 3, d: true, e: false, f: "a", g: "b", h: emptyCell(), i: myAddress(), j: emptyCell().asSlice(), k: false, l: -5
        };
    }
}