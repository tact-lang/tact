struct Weird {
    a: Int as uint8;
    b: Bool;
    c: Int?;
    d: Int as uint16;
    e: Bool?;
    f: String;
    g: Int?;
}

contract TestContract {
    val: Weird;

    init() {
        self.val = Weird{
            a: 255,
            b: true,
            c: null,
            d: 65535,
            e: false,
            f: "weird",
            g: null
        };
    }
}