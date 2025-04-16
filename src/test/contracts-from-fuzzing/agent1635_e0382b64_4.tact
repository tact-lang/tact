struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Address;
}

contract Test {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1, b: true, c: "ok", d: emptyCell().asSlice(), e: emptyCell(), f: myAddress(),
            g: null, h: false, i: "hi", j: myAddress()
        };
    }
}
