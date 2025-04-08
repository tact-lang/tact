struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int;
    j: Bool;
}

contract TestContract {
    s: ManyFields;
    
    init() {
        self.s = ManyFields{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: null,
            f: null,
            g: null,
            h: null,
            i: 2,
            j: false
        };
    }
}