struct Diverse {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract MixedFieldStruct {
    f: Diverse;
    init() {
        self.f = Diverse{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "hello",
            f: null,
            g: myAddress(),
            h: null
        };
    }
}