struct Mixed {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
}

contract MixedFieldTypes {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "hello",
            f: null,
            g: myAddress(),
            h: null
        };
    }
}