struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int;
    h: Bool;
    i: String;
    j: Cell;
    k: Slice;
    l: Address;
}

contract LargeFlatStructTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1, b: true, c: "x", d: emptyCell(), e: emptyCell().asSlice(), f: myAddress(),
            g: 2, h: false, i: "y", j: emptyCell(), k: emptyCell().asSlice(), l: myAddress(),
        };
    }
}