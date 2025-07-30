struct ManyFields {
    a: Int;
    b: Int;
    c: Int?;
    d: Bool;
    e: Bool?;
    f: String;
    g: String?;
    h: Address;
    i: Address?;
    j: Int;
    k: Bool;
    l: String;
    m: Address;
}

contract TestContract {
    bigOne: ManyFields;
    
    init() {
        self.bigOne = ManyFields{
            a: 1,
            b: 2,
            c: 3,
            d: true,
            e: false,
            f: "abc",
            g: null,
            h: myAddress(),
            i: null,
            j: 10,
            k: false,
            l: "xyz",
            m: myAddress()
        };
    }
}