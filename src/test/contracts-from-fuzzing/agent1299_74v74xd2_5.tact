struct ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Bool;
    f: Int;
    g: String;
    h: Address;
    i: Bool;
    j: Int;
}

contract ManyFieldsTest {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a: 1,
            b: true,
            c: myAddress(),
            d: "d",
            e: false,
            f: 42,
            g: "g",
            h: myAddress(),
            i: true,
            j: 999,
        };
    }
}
