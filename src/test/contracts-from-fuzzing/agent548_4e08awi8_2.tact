struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: String?;
    i: Address?;
}

contract ManyTypes {
    field: S1;

    init() {
        self.field = S1{
            a: 1,
            b: true,
            c: "text",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
        };
    }
}
