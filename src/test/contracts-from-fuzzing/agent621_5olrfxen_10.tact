struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract MixedStructHold {
    field: Mixed;
    init() {
        self.field = Mixed{
            a: 1,
            b: true,
            c: "text",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: null
        };
    }
}