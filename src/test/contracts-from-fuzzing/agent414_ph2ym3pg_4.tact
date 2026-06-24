struct ManyFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: String;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Address;
}

contract LargeStructStorage {
    container: ManyFields;
    init() {
        self.container = ManyFields{
            a: 1,
            b: 2,
            c: true,
            d: false,
            e: "test",
            f: myAddress(),
            g: null,
            h: null,
            i: "test2",
            j: myAddress()
        };
    }
}
