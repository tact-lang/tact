struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String;
    h: Int;
    i: Bool;
    j: String;
    k: Int;
    l: Bool;
}

contract BigFields {
    val: ManyFields;
    init() {
        self.val = ManyFields {
            a: 1,
            b: true,
            c: "", 
            d: myAddress(),
            e: null,
            f: null,
            g: "x",
            h: 2,
            i: false,
            j: "y",
            k: 3,
            l: true
        };
    }
}