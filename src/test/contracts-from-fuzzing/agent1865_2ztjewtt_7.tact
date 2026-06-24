struct Large {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int as uint32;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int?;
    j: Bool;
}

contract ManyFields {
    data: Large;

    init() {
        self.data = Large{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: 10,
            f: false,
            g: null,
            h: null,
            i: null,
            j: false,
        };
    }
}