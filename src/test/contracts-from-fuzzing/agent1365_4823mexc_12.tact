struct Mixed {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: Address?;
    g: String;
    h: String?;
}

contract MixedNested {
    mix: Mixed;

    init() {
        self.mix = Mixed{
            a: 7,
            b: true,
            c: myAddress(),
            d: 8,
            e: false,
            f: null,
            g: "hello",
            h: null,
        };
    }
}