struct StructWithManyFields {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Int;
    f: String;
    g: Bool;
    h: Address;
    i: Int;
    j: String;
}

contract Test {
    s: StructWithManyFields;

    init() {
        self.s = StructWithManyFields{
            a: 1,
            b: "b",
            c: true,
            d: myAddress(),
            e: 2,
            f: "f",
            g: false,
            h: myAddress(),
            i: 3,
            j: "j",
        };
    }
}
