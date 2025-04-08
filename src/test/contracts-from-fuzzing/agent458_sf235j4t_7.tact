struct ManyFields {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Address; // no default value here
    e: Int?;
    f: Bool?;
    g: String?;
}

contract WithManyStructFields {
    s: ManyFields;

    init() {
        self.s = ManyFields{
            a: 777,
            b: true,
            c: "hello",
            d: myAddress(),
            e: null,
            f: null,
            g: null,
        };
    }
}