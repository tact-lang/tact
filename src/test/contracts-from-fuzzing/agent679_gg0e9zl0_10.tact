struct Mixed {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Int;
    g: Bool;
    h: String?;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "hi",
            f: 2,
            g: false,
            h: null,
        };
    }
}