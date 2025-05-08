struct VeryWide {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint8;
    h: Int as int4;
    i: String;
    j: Bool;
    k: Int;
    l: String?;
}

contract WideFieldsTest {
    optWide: VeryWide;

    init() {
        self.optWide = VeryWide{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null,
            g: 4,
            h: -3,
            i: "bye",
            j: false,
            k: 999,
            l: null
        };
    }
}