struct MidSize {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MediumStructComb {
    m: MidSize;

    init() {
        self.m = MidSize{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: null,
            f: null
        };
    }
}