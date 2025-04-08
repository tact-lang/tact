struct Meta {
    id: Int as uint8;
    value: Int as uint64;
    text: String;
    marker: Bool?;
}

contract Test {
    a: Int as coins;
    b: Int as uint32;
    c: Bool;
    d: Bool?;
    e: String;
    f: Address?;
    g: Meta;

    init() {
        self.a = ton("1");
        self.b = 1234;
        self.c = true;
        self.d = null;
        self.e = "abc";
        self.f = null;
        self.g = Meta{
            id: 1,
            value: 42,
            text: "meta",
            marker: null
        };
    }
}