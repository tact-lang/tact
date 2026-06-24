struct Sample {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract TestContract {
    s: Sample;
    init() {
        self.s = Sample{
            a: 1,
            b: true,
            c: "test",
            d: myAddress(),
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}